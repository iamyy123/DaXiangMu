package com.ruoyi.wms.service;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.AllocationSuggestionBo;
import com.ruoyi.wms.domain.bo.AllocationSuggestionDetailBo;
import com.ruoyi.wms.domain.bo.ApprovalRecordBo;
import com.ruoyi.wms.domain.bo.PortfolioChangeLogBo;
import com.ruoyi.wms.domain.entity.AllocationSuggestion;
import com.ruoyi.wms.domain.entity.AllocationSuggestionDetail;
import com.ruoyi.wms.domain.entity.ApprovalRecord;
import com.ruoyi.wms.domain.entity.Portfolio;
import com.ruoyi.wms.domain.vo.AllocationSuggestionVo;
import com.ruoyi.wms.domain.vo.AllocationSuggestionDetailVo;
import com.ruoyi.wms.mapper.AllocationSuggestionMapper;
import com.ruoyi.wms.mapper.AllocationSuggestionDetailMapper;
import com.ruoyi.wms.mapper.ApprovalRecordMapper;
import com.ruoyi.wms.mapper.PortfolioChangeLogMapper;
import com.ruoyi.wms.mapper.PortfolioMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Log4j2
public class AllocationSuggestionService {

    private final AllocationSuggestionMapper allocationSuggestionMapper;
    private final AllocationSuggestionDetailMapper allocationSuggestionDetailMapper;
    private final ApprovalRecordMapper approvalRecordMapper;
    private final PortfolioMapper portfolioMapper;
    private final PortfolioChangeLogMapper portfolioChangeLogMapper;
    private final CryptoCurrencyService cryptoCurrencyService;

    /**
     * 查询资产配置建议
     */
    public AllocationSuggestionVo queryById(Long id) {
        AllocationSuggestionVo suggestion = allocationSuggestionMapper.selectVoById(id);
        if (suggestion != null) {
            List<AllocationSuggestionDetailVo> details = getAllocationDetailsBySuggestionId(id);
            suggestion.setDetailList(details);
        }
        return suggestion;
    }

    /**
     * 查询资产配置建议列表
     */
    public TableDataInfo<AllocationSuggestionVo> queryPageList(AllocationSuggestionBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<AllocationSuggestion> lqw = buildQueryWrapper(bo);
        Page<AllocationSuggestionVo> result = allocationSuggestionMapper.selectVoPage(pageQuery.build(), lqw);
        List<AllocationSuggestionVo> suggestionList = result.getRecords();
        
        for (AllocationSuggestionVo suggestion : suggestionList) {
            List<AllocationSuggestionDetailVo> details = getAllocationDetailsBySuggestionId(suggestion.getId());
            suggestion.setDetailList(details);
        }
        
        return TableDataInfo.build(result);
    }

    /**
     * 查询资产配置建议列表
     */
    public List<AllocationSuggestionVo> queryList(AllocationSuggestionBo bo) {
        LambdaQueryWrapper<AllocationSuggestion> lqw = buildQueryWrapper(bo);
        List<AllocationSuggestionVo> suggestionList = allocationSuggestionMapper.selectVoList(lqw);
        
        for (AllocationSuggestionVo suggestion : suggestionList) {
            List<AllocationSuggestionDetailVo> details = getAllocationDetailsBySuggestionId(suggestion.getId());
            suggestion.setDetailList(details);
        }
        
        return suggestionList;
    }

    private LambdaQueryWrapper<AllocationSuggestion> buildQueryWrapper(AllocationSuggestionBo bo) {
        LambdaQueryWrapper<AllocationSuggestion> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getStatus() != null, AllocationSuggestion::getStatus, bo.getStatus());
        lqw.eq(bo.getSuggestionDate() != null, AllocationSuggestion::getSuggestionDate, bo.getSuggestionDate());
        lqw.orderByDesc(AllocationSuggestion::getSuggestionDate);
        return lqw;
    }

    /**
     * 根据配置建议ID查询配置建议详情
     */
    private List<AllocationSuggestionDetailVo> getAllocationDetailsBySuggestionId(Long suggestionId) {
        LambdaQueryWrapper<AllocationSuggestionDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(AllocationSuggestionDetail::getSuggestionId, suggestionId);
        List<AllocationSuggestionDetailVo> details = allocationSuggestionDetailMapper.selectVoList(lqw);
        
        // 为配置建议详情添加数字货币信息
        for (AllocationSuggestionDetailVo detail : details) {
            if (detail.getCurrencyId() != null) {
                detail.setSymbol(cryptoCurrencyService.queryById(detail.getCurrencyId()).getSymbol());
            }
        }
        
        return details;
    }

    /**
     * 新增资产配置建议
     */
    @Transactional
    public void insertByBo(AllocationSuggestionBo bo) {
        AllocationSuggestion suggestion = MapstructUtils.convert(bo, AllocationSuggestion.class);
        suggestion.setSuggestionDate(LocalDate.now());
        suggestion.setStatus(0); // 初始状态为待审核
        allocationSuggestionMapper.insert(suggestion);
        
        // 保存配置建议详情
        if (bo.getDetailList() != null && !bo.getDetailList().isEmpty()) {
            for (AllocationSuggestionDetailBo detailBo : bo.getDetailList()) {
                AllocationSuggestionDetail detail = MapstructUtils.convert(detailBo, AllocationSuggestionDetail.class);
                detail.setSuggestionId(suggestion.getId());
                allocationSuggestionDetailMapper.insert(detail);
            }
        }
    }

    /**
     * 修改资产配置建议
     */
    @Transactional
    public void updateByBo(AllocationSuggestionBo bo) {
        AllocationSuggestion suggestion = MapstructUtils.convert(bo, AllocationSuggestion.class);
        allocationSuggestionMapper.updateById(suggestion);
        
        // 删除原有配置建议详情
        LambdaQueryWrapper<AllocationSuggestionDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(AllocationSuggestionDetail::getSuggestionId, bo.getId());
        allocationSuggestionDetailMapper.delete(lqw);
        
        // 保存新的配置建议详情
        if (bo.getDetailList() != null && !bo.getDetailList().isEmpty()) {
            for (AllocationSuggestionDetailBo detailBo : bo.getDetailList()) {
                AllocationSuggestionDetail detail = MapstructUtils.convert(detailBo, AllocationSuggestionDetail.class);
                detail.setSuggestionId(suggestion.getId());
                allocationSuggestionDetailMapper.insert(detail);
            }
        }
    }

    /**
     * 删除资产配置建议
     */
    @Transactional
    public void deleteById(Long id) {
        // 删除配置建议详情
        LambdaQueryWrapper<AllocationSuggestionDetail> lqw = Wrappers.lambdaQuery();
        lqw.eq(AllocationSuggestionDetail::getSuggestionId, id);
        allocationSuggestionDetailMapper.delete(lqw);
        
        // 删除配置建议
        allocationSuggestionMapper.deleteById(id);
    }

    /**
     * 批量删除资产配置建议
     */
    @Transactional
    public void deleteByIds(List<Long> ids) {
        for (Long id : ids) {
            deleteById(id);
        }
    }

    /**
     * 审核资产配置建议
     */
    @Transactional
    public void approveSuggestion(Long suggestionId, Integer approvalResult, String approvalComment, Long approverId, String approverName) {
        // 更新配置建议状态
        AllocationSuggestion suggestion = allocationSuggestionMapper.selectById(suggestionId);
        suggestion.setStatus(approvalResult);
        allocationSuggestionMapper.updateById(suggestion);
        
        // 记录审核记录
        ApprovalRecordBo approvalRecordBo = new ApprovalRecordBo();
        approvalRecordBo.setSuggestionId(suggestionId);
        approvalRecordBo.setApproverId(approverId);
        approvalRecordBo.setApproverName(approverName);
        approvalRecordBo.setApprovalResult(approvalResult);
        approvalRecordBo.setApprovalComment(approvalComment);
        approvalRecordBo.setApprovalTime(LocalDateTimeUtil.now());
        
        ApprovalRecord approvalRecord = MapstructUtils.convert(approvalRecordBo, ApprovalRecord.class);
        approvalRecordMapper.insert(approvalRecord);
        
        // 如果审核通过，更新持仓数据
        if (approvalResult == 1) {
            updatePortfolioByApprovedSuggestion(suggestionId);
        }
    }

    /**
     * 根据审核通过的配置建议更新持仓数据
     */
    @Transactional
    private void updatePortfolioByApprovedSuggestion(Long suggestionId) {
        // 查询配置建议详情
        LambdaQueryWrapper<AllocationSuggestionDetail> detailWrapper = Wrappers.lambdaQuery();
        detailWrapper.eq(AllocationSuggestionDetail::getSuggestionId, suggestionId);
        List<AllocationSuggestionDetail> details = allocationSuggestionDetailMapper.selectList(detailWrapper);
        
        for (AllocationSuggestionDetail detail : details) {
            // 查询当前持仓
            LambdaQueryWrapper<Portfolio> portfolioWrapper = Wrappers.lambdaQuery();
            portfolioWrapper.eq(Portfolio::getCurrencyId, detail.getCurrencyId());
            Portfolio portfolio = portfolioMapper.selectOne(portfolioWrapper);
            
            if (portfolio != null) {
                // 记录持仓变更日志
                PortfolioChangeLogBo changeLogBo = new PortfolioChangeLogBo();
                changeLogBo.setPortfolioId(portfolio.getId());
                changeLogBo.setCurrencyId(detail.getCurrencyId());
                changeLogBo.setBeforeQuantity(portfolio.getQuantity());
                changeLogBo.setAfterQuantity(detail.getTargetQuantity());
                changeLogBo.setBeforeAvgPrice(portfolio.getAvgPrice());
                // 计算新的平均价格（这里简化处理，实际应根据交易记录计算）
                changeLogBo.setAfterAvgPrice(portfolio.getAvgPrice());
                changeLogBo.setChangeReason("根据资产配置建议调整持仓");
                changeLogBo.setChangeTime(LocalDateTimeUtil.now());
                
                portfolioChangeLogMapper.insert(MapstructUtils.convert(changeLogBo, com.ruoyi.wms.domain.entity.PortfolioChangeLog.class));
                
                // 更新持仓数据
                portfolio.setQuantity(detail.getTargetQuantity());
                portfolio.setAllocationPercent(detail.getTargetAllocation());
                portfolioMapper.updateById(portfolio);
            }
        }
    }
}
