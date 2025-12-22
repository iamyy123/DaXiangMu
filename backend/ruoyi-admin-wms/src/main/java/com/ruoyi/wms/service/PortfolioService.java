package com.ruoyi.wms.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.PortfolioBo;
import com.ruoyi.wms.domain.bo.CryptoCurrencyBo;
import com.ruoyi.wms.domain.entity.Portfolio;
import com.ruoyi.wms.domain.vo.PortfolioVo;
import com.ruoyi.wms.domain.vo.CryptoCurrencyVo;
import com.ruoyi.wms.mapper.PortfolioMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class PortfolioService {

    private final PortfolioMapper portfolioMapper;
    private final CryptoCurrencyService cryptoCurrencyService;

    /**
     * 查询持仓
     */
    public PortfolioVo queryById(Long id) {
        PortfolioVo portfolio = portfolioMapper.selectVoById(id);
        enrichPortfolioWithCurrencyInfo(portfolio);
        return portfolio;
    }

    /**
     * 查询持仓列表
     */
    public TableDataInfo<PortfolioVo> queryPageList(PortfolioBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Portfolio> lqw = buildQueryWrapper(bo);
        Page<PortfolioVo> result = portfolioMapper.selectVoPage(pageQuery.build(), lqw);
        List<PortfolioVo> portfolioList = result.getRecords();
        enrichPortfolioWithCurrencyInfo(portfolioList);
        return TableDataInfo.build(result);
    }

    /**
     * 查询持仓列表
     */
    public List<PortfolioVo> queryList(PortfolioBo bo) {
        LambdaQueryWrapper<Portfolio> lqw = buildQueryWrapper(bo);
        List<PortfolioVo> portfolioList = portfolioMapper.selectVoList(lqw);
        enrichPortfolioWithCurrencyInfo(portfolioList);
        return portfolioList;
    }

    private LambdaQueryWrapper<Portfolio> buildQueryWrapper(PortfolioBo bo) {
        LambdaQueryWrapper<Portfolio> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getCurrencyId() != null, Portfolio::getCurrencyId, bo.getCurrencyId());
        return lqw;
    }

    /**
     * 新增持仓
     */
    public void insertByBo(PortfolioBo bo) {
        Portfolio add = MapstructUtils.convert(bo, Portfolio.class);
        portfolioMapper.insert(add);
    }

    /**
     * 修改持仓
     */
    public void updateByBo(PortfolioBo bo) {
        Portfolio update = MapstructUtils.convert(bo, Portfolio.class);
        portfolioMapper.updateById(update);
    }

    /**
     * 删除持仓
     */
    public void deleteById(Long id) {
        portfolioMapper.deleteById(id);
    }

    /**
     * 批量删除持仓
     */
    public void deleteByIds(Collection<Long> ids) {
        portfolioMapper.deleteBatchIds(ids);
    }

    /**
     * 为持仓添加数字货币信息
     */
    private void enrichPortfolioWithCurrencyInfo(List<PortfolioVo> portfolioList) {
        if (portfolioList.isEmpty()) {
            return;
        }
        
        List<Long> currencyIds = portfolioList.stream()
                .map(PortfolioVo::getCurrencyId)
                .collect(Collectors.toList());
        
        CryptoCurrencyBo currencyBo = new CryptoCurrencyBo();
        List<CryptoCurrencyVo> currencies = cryptoCurrencyService.queryList(currencyBo);
        
        for (PortfolioVo portfolio : portfolioList) {
            for (CryptoCurrencyVo currency : currencies) {
                if (currency.getId().equals(portfolio.getCurrencyId())) {
                    portfolio.setCurrencyName(currency.getName());
                    portfolio.setSymbol(currency.getSymbol());
                    break;
                }
            }
        }
    }

    /**
     * 为单个持仓添加数字货币信息
     */
    private void enrichPortfolioWithCurrencyInfo(PortfolioVo portfolio) {
        if (portfolio == null || portfolio.getCurrencyId() == null) {
            return;
        }
        
        CryptoCurrencyVo currency = cryptoCurrencyService.queryById(portfolio.getCurrencyId());
        if (currency != null) {
            portfolio.setCurrencyName(currency.getName());
            portfolio.setSymbol(currency.getSymbol());
        }
    }
}
