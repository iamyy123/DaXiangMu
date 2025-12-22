package com.ruoyi.wms.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.MarketNewsBo;
import com.ruoyi.wms.domain.bo.CryptoCurrencyBo;
import com.ruoyi.wms.domain.entity.MarketNews;
import com.ruoyi.wms.domain.vo.MarketNewsVo;
import com.ruoyi.wms.domain.vo.CryptoCurrencyVo;
import com.ruoyi.wms.mapper.MarketNewsMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class MarketNewsService {

    private final MarketNewsMapper marketNewsMapper;
    private final CryptoCurrencyService cryptoCurrencyService;

    /**
     * 查询市场消息
     */
    public MarketNewsVo queryById(Long id) {
        MarketNewsVo news = marketNewsMapper.selectVoById(id);
        enrichNewsWithCurrencyInfo(news);
        return news;
    }

    /**
     * 查询市场消息列表
     */
    public TableDataInfo<MarketNewsVo> queryPageList(MarketNewsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<MarketNews> lqw = buildQueryWrapper(bo);
        Page<MarketNewsVo> result = marketNewsMapper.selectVoPage(pageQuery.build(), lqw);
        List<MarketNewsVo> newsList = result.getRecords();
        enrichNewsWithCurrencyInfo(newsList);
        return TableDataInfo.build(result);
    }

    /**
     * 查询市场消息列表
     */
    public List<MarketNewsVo> queryList(MarketNewsBo bo) {
        LambdaQueryWrapper<MarketNews> lqw = buildQueryWrapper(bo);
        List<MarketNewsVo> newsList = marketNewsMapper.selectVoList(lqw);
        enrichNewsWithCurrencyInfo(newsList);
        return newsList;
    }

    private LambdaQueryWrapper<MarketNews> buildQueryWrapper(MarketNewsBo bo) {
        LambdaQueryWrapper<MarketNews> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getCurrencyId() != null, MarketNews::getCurrencyId, bo.getCurrencyId());
        lqw.like(StrUtil.isNotBlank(bo.getTitle()), MarketNews::getTitle, bo.getTitle());
        lqw.eq(bo.getSentiment() != null, MarketNews::getSentiment, bo.getSentiment());
        lqw.orderByDesc(MarketNews::getPublishTime);
        return lqw;
    }

    /**
     * 新增市场消息
     */
    public void insertByBo(MarketNewsBo bo) {
        MarketNews add = MapstructUtils.convert(bo, MarketNews.class);
        marketNewsMapper.insert(add);
    }

    /**
     * 修改市场消息
     */
    public void updateByBo(MarketNewsBo bo) {
        MarketNews update = MapstructUtils.convert(bo, MarketNews.class);
        marketNewsMapper.updateById(update);
    }

    /**
     * 删除市场消息
     */
    public void deleteById(Long id) {
        marketNewsMapper.deleteById(id);
    }

    /**
     * 批量删除市场消息
     */
    public void deleteByIds(Collection<Long> ids) {
        marketNewsMapper.deleteBatchIds(ids);
    }

    /**
     * 为市场消息添加数字货币信息
     */
    private void enrichNewsWithCurrencyInfo(List<MarketNewsVo> newsList) {
        if (newsList.isEmpty()) {
            return;
        }
        
        List<Long> currencyIds = newsList.stream()
                .map(MarketNewsVo::getCurrencyId)
                .collect(Collectors.toList());
        
        CryptoCurrencyBo currencyBo = new CryptoCurrencyBo();
        List<CryptoCurrencyVo> currencies = cryptoCurrencyService.queryList(currencyBo);
        
        for (MarketNewsVo news : newsList) {
            for (CryptoCurrencyVo currency : currencies) {
                if (currency.getId().equals(news.getCurrencyId())) {
                    news.setCurrencyName(currency.getName());
                    break;
                }
            }
            
            // 设置情感倾向描述
            if (news.getSentiment() != null) {
                switch (news.getSentiment()) {
                    case -1:
                        news.setSentimentDesc("利空");
                        break;
                    case 0:
                        news.setSentimentDesc("中性");
                        break;
                    case 1:
                        news.setSentimentDesc("利好");
                        break;
                    default:
                        news.setSentimentDesc("未知");
                }
            }
        }
    }

    /**
     * 为单个市场消息添加数字货币信息
     */
    private void enrichNewsWithCurrencyInfo(MarketNewsVo news) {
        if (news == null || news.getCurrencyId() == null) {
            return;
        }
        
        CryptoCurrencyVo currency = cryptoCurrencyService.queryById(news.getCurrencyId());
        if (currency != null) {
            news.setCurrencyName(currency.getName());
        }
        
        // 设置情感倾向描述
        if (news.getSentiment() != null) {
            switch (news.getSentiment()) {
                case -1:
                    news.setSentimentDesc("利空");
                    break;
                case 0:
                    news.setSentimentDesc("中性");
                    break;
                case 1:
                    news.setSentimentDesc("利好");
                    break;
                default:
                    news.setSentimentDesc("未知");
            }
        }
    }
}
