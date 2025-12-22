package com.ruoyi.wms.task;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.wms.domain.bo.AllocationSuggestionBo;
import com.ruoyi.wms.domain.bo.AllocationSuggestionDetailBo;
import com.ruoyi.wms.domain.entity.AllocationSuggestion;
import com.ruoyi.wms.domain.entity.AllocationSuggestionDetail;
import com.ruoyi.wms.domain.entity.Portfolio;
import com.ruoyi.wms.domain.vo.MarketNewsVo;
import com.ruoyi.wms.domain.vo.PortfolioVo;
import com.ruoyi.wms.mapper.AllocationSuggestionDetailMapper;
import com.ruoyi.wms.mapper.AllocationSuggestionMapper;
import com.ruoyi.wms.service.MarketNewsService;
import com.ruoyi.wms.service.PortfolioService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 投资组合分析定时任务
 */
@Component
@RequiredArgsConstructor
@Log4j2
public class PortfolioAnalysisTask {

    private final PortfolioService portfolioService;
    private final MarketNewsService marketNewsService;
    private final AllocationSuggestionMapper allocationSuggestionMapper;
    private final AllocationSuggestionDetailMapper allocationSuggestionDetailMapper;

    /**
     * 每天凌晨3:00执行投资组合分析
     */
    @Scheduled(cron = "0 0 3 * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void analyzePortfolio() {
        try {
            log.info("开始执行投资组合分析定时任务");

            // 1. 获取当前投资组合数据
            List<PortfolioVo> portfolioList = portfolioService.queryList(null);
            if (portfolioList.isEmpty()) {
                log.info("没有找到投资组合数据，跳过分析");
                return;
            }

            // 2. 获取最近的市场新闻
            List<MarketNewsVo> newsList = marketNewsService.queryList(null);
            if (newsList.isEmpty()) {
                log.info("没有找到市场新闻数据，跳过分析");
                return;
            }

            // 3. 按加密货币分组新闻
            Map<Long, List<MarketNewsVo>> newsByCurrency = newsList.stream()
                    .collect(Collectors.groupingBy(MarketNewsVo::getCurrencyId));

            // 4. 计算总投资价值
            BigDecimal totalInvestment = portfolioList.stream()
                    .map(PortfolioVo::getCurrentValue)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            // 5. 创建资产配置建议主记录
            AllocationSuggestion suggestion = new AllocationSuggestion();
            suggestion.setSuggestionDate(LocalDate.now());
            suggestion.setTotalValue(totalInvestment);
            suggestion.setStatus(0); // 初始状态为待审核
            allocationSuggestionMapper.insert(suggestion);

            // 6. 生成配置建议详情
            List<AllocationSuggestionDetail> details = new ArrayList<>();
            for (PortfolioVo portfolio : portfolioList) {
                Long currencyId = portfolio.getCurrencyId();
                List<MarketNewsVo> currencyNews = newsByCurrency.getOrDefault(currencyId, new ArrayList<>());

                // 计算该加密货币的情感得分
                double sentimentScore = calculateCurrencySentimentScore(currencyNews);

                // 获取当前持仓比例
                BigDecimal currentValue = portfolio.getCurrentValue();
                BigDecimal currentAllocation = totalInvestment.compareTo(BigDecimal.ZERO) > 0 ? 
                        currentValue.divide(totalInvestment, 4, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)) : 
                        BigDecimal.ZERO;

                // 基于情感得分调整目标比例
                BigDecimal targetAllocation = calculateTargetAllocation(currentAllocation, sentimentScore);

                // 计算目标数量
                BigDecimal currentPrice = currentValue.divide(portfolio.getQuantity(), 8, BigDecimal.ROUND_HALF_UP);
                BigDecimal targetValue = totalInvestment.multiply(targetAllocation.divide(new BigDecimal(100), 8, BigDecimal.ROUND_HALF_UP));
                BigDecimal targetQuantity = currentPrice.compareTo(BigDecimal.ZERO) > 0 ? 
                        targetValue.divide(currentPrice, 8, BigDecimal.ROUND_HALF_UP) : 
                        BigDecimal.ZERO;
                BigDecimal changeQuantity = targetQuantity.subtract(portfolio.getQuantity());

                // 确定变动类型
                Integer changeType = 0;
                if (changeQuantity.compareTo(BigDecimal.ZERO) > 0) {
                    changeType = 1; // 买入
                } else if (changeQuantity.compareTo(BigDecimal.ZERO) < 0) {
                    changeType = -1; // 卖出
                }

                // 创建配置建议详情
                AllocationSuggestionDetail detail = new AllocationSuggestionDetail();
                detail.setSuggestionId(suggestion.getId());
                detail.setCurrencyId(currencyId);
                detail.setCurrentQuantity(portfolio.getQuantity());
                detail.setTargetQuantity(targetQuantity);
                detail.setTargetAllocation(targetAllocation);
                detail.setChangeQuantity(changeQuantity);
                detail.setChangeType(changeType);

                details.add(detail);
            }

            // 7. 调整建议确保总比例为100%
            adjustAllocationsToTotal100(details, totalInvestment, portfolioList);

            // 8. 保存配置建议详情
            if (!details.isEmpty()) {
                allocationSuggestionDetailMapper.insertBatch(details);
            }

            // 9. 生成AI分析报告
            String aiAnalysis = generateAiAnalysis(portfolioList, newsList, details);
            suggestion.setAiAnalysis(aiAnalysis);
            allocationSuggestionMapper.updateById(suggestion);

            log.info("投资组合分析定时任务执行完成，生成建议ID: {}", suggestion.getId());

        } catch (Exception e) {
            log.error("执行投资组合分析定时任务失败", e);
        }
    }

    /**
     * 计算加密货币的情感得分
     */
    private double calculateCurrencySentimentScore(List<MarketNewsVo> newsList) {
        if (newsList.isEmpty()) {
            return 0.0;
        }

        return newsList.stream()
                .mapToDouble(news -> news.getSentiment() * news.getRelevance())
                .average()
                .orElse(0.0);
    }

    /**
     * 基于情感得分计算目标持仓比例
     */
    private BigDecimal calculateTargetAllocation(BigDecimal currentAllocation, double sentimentScore) {
        // 根据情感得分调整持仓比例，最大调整幅度为±5%
        BigDecimal adjustment = new BigDecimal(sentimentScore * 2.5);
        BigDecimal targetAllocation = currentAllocation.add(adjustment);

        // 确保目标比例在5%-50%之间
        if (targetAllocation.compareTo(new BigDecimal(5)) < 0) {
            targetAllocation = new BigDecimal(5);
        } else if (targetAllocation.compareTo(new BigDecimal(50)) > 0) {
            targetAllocation = new BigDecimal(50);
        }

        return targetAllocation.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    /**
     * 调整建议确保总比例为100%
     */
    private void adjustAllocationsToTotal100(List<AllocationSuggestionDetail> details, BigDecimal totalInvestment, List<PortfolioVo> portfolioList) {
        BigDecimal totalAllocation = details.stream()
                .map(AllocationSuggestionDetail::getTargetAllocation)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        BigDecimal difference = new BigDecimal(100).subtract(totalAllocation);
        if (difference.compareTo(BigDecimal.ZERO) == 0) {
            return;
        }

        // 找出持仓比例最大的建议进行调整
        details.sort((a, b) -> b.getTargetAllocation().compareTo(a.getTargetAllocation()));
        AllocationSuggestionDetail largestDetail = details.get(0);
        BigDecimal newAllocation = largestDetail.getTargetAllocation().add(difference);
        largestDetail.setTargetAllocation(newAllocation.setScale(2, BigDecimal.ROUND_HALF_UP));

        // 更新目标数量和变动数量
        BigDecimal targetValue = totalInvestment.multiply(newAllocation.divide(new BigDecimal(100), 8, BigDecimal.ROUND_HALF_UP));
        // 为了简化计算，我们假设当前价格保持不变
        // 实际应用中应该从市场获取最新价格
        BigDecimal currentPrice = BigDecimal.ONE; // 默认值，实际应用中应该获取真实价格
        // 查找该货币的当前价格（这里简化处理，实际应该从portfolio或市场获取）
        PortfolioVo portfolio = portfolioList.stream()
                .filter(p -> p.getCurrencyId().equals(largestDetail.getCurrencyId().toString()))
                .findFirst()
                .orElse(null);
        if (portfolio != null && portfolio.getQuantity().compareTo(BigDecimal.ZERO) > 0) {
            currentPrice = portfolio.getCurrentValue().divide(portfolio.getQuantity(), 8, BigDecimal.ROUND_HALF_UP);
        }
        BigDecimal targetQuantity = currentPrice.compareTo(BigDecimal.ZERO) > 0 ? 
                targetValue.divide(currentPrice, 8, BigDecimal.ROUND_HALF_UP) : 
                BigDecimal.ZERO;
        largestDetail.setTargetQuantity(targetQuantity);
        largestDetail.setChangeQuantity(targetQuantity.subtract(largestDetail.getCurrentQuantity()));
        
        // 更新变动类型
        if (largestDetail.getChangeQuantity().compareTo(BigDecimal.ZERO) > 0) {
            largestDetail.setChangeType(1); // 买入
        } else if (largestDetail.getChangeQuantity().compareTo(BigDecimal.ZERO) < 0) {
            largestDetail.setChangeType(-1); // 卖出
        } else {
            largestDetail.setChangeType(0); // 不变
        }
    }

    /**
     * 根据货币ID查找详情
     */
    private AllocationSuggestionDetail findDetailByCurrencyId(List<AllocationSuggestionDetail> details, Long currencyId) {
        for (AllocationSuggestionDetail detail : details) {
            if (detail.getCurrencyId().equals(currencyId)) {
                return detail;
            }
        }
        return null;
    }

    /**
     * 生成AI分析报告
     */
    private String generateAiAnalysis(List<PortfolioVo> portfolioList, List<MarketNewsVo> newsList, List<AllocationSuggestionDetail> details) {
        StringBuilder analysis = new StringBuilder();

        analysis.append("# AI投资组合分析报告\n\n");
        analysis.append("## 市场概况\n");
        analysis.append("根据最近收集的市场新闻，我们对主流加密货币市场进行了情感分析：\n");

        // 按加密货币分组新闻并计算情感得分
        Map<Long, List<MarketNewsVo>> newsByCurrency = newsList.stream()
                .collect(Collectors.groupingBy(MarketNewsVo::getCurrencyId));

        for (PortfolioVo portfolio : portfolioList) {
            Long currencyId = portfolio.getCurrencyId();
            List<MarketNewsVo> currencyNews = newsByCurrency.getOrDefault(currencyId, new ArrayList<>());
            double sentimentScore = calculateCurrencySentimentScore(currencyNews);

            analysis.append("- ").append(portfolio.getCurrencyName()).append("：");
            if (sentimentScore > 0.5) {
                analysis.append("市场情绪积极（利好）");
            } else if (sentimentScore < -0.5) {
                analysis.append("市场情绪消极（利空）");
            } else {
                analysis.append("市场情绪中性");
            }
            analysis.append("，情感得分：").append(String.format("%.2f", sentimentScore)).append("\n");
        }

        analysis.append("\n## 持仓调整建议\n");
        analysis.append("基于市场情感分析和当前持仓情况，我们建议进行以下调整：\n");

        for (AllocationSuggestionDetail detail : details) {
            // 查找对应的portfolio信息
            PortfolioVo portfolio = portfolioList.stream()
                    .filter(p -> p.getCurrencyId().equals(detail.getCurrencyId().toString()))
                    .findFirst()
                    .orElse(null);

            if (portfolio != null) {
                analysis.append("- ").append(portfolio.getCurrencyName()).append("：\n");
                analysis.append("  当前持仓：").append(portfolio.getQuantity()).append("，占比：")
                        .append(calculateAllocationPercentage(portfolio.getCurrentValue(), portfolioList)).append("%\n");
                analysis.append("  建议调整：").append(detail.getChangeType() == 1 ? "买入" : detail.getChangeType() == -1 ? "卖出" : "维持")
                        .append(" ").append(detail.getChangeQuantity().abs()).append("，调整后占比：")
                        .append(detail.getTargetAllocation()).append("%\n");
            }
        }

        analysis.append("\n## 总结\n");
        analysis.append("本次分析基于最新市场新闻和当前持仓情况，通过AI情感分析算法生成调整建议。\n");
        analysis.append("建议关注市场动态变化，定期review持仓策略。\n");
        analysis.append("\n分析时间：").append(DateUtils.getNowDate()).append("\n");

        return analysis.toString();
    }

    /**
     * 计算持仓百分比
     */
    private String calculateAllocationPercentage(BigDecimal currentValue, List<PortfolioVo> portfolioList) {
        BigDecimal totalValue = portfolioList.stream()
                .map(PortfolioVo::getCurrentValue)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        if (totalValue.compareTo(BigDecimal.ZERO) == 0) {
            return "0.00";
        }

        return currentValue.divide(totalValue, 4, BigDecimal.ROUND_HALF_UP)
                .multiply(new BigDecimal(100))
                .setScale(2, BigDecimal.ROUND_HALF_UP)
                .toString();
    }
}