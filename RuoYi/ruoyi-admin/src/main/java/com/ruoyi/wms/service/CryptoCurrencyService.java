package com.ruoyi.wms.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.CryptoCurrencyBo;
import com.ruoyi.wms.domain.entity.CryptoCurrency;
import com.ruoyi.wms.domain.vo.CryptoCurrencyVo;
import com.ruoyi.wms.mapper.CryptoCurrencyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@RequiredArgsConstructor
@Service
public class CryptoCurrencyService {

    private final CryptoCurrencyMapper cryptoCurrencyMapper;

    /**
     * 查询数字货币
     */
    public CryptoCurrencyVo queryById(Long id) {
        return cryptoCurrencyMapper.selectVoById(id);
    }

    /**
     * 查询数字货币列表
     */
    public TableDataInfo<CryptoCurrencyVo> queryPageList(CryptoCurrencyBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<CryptoCurrency> lqw = buildQueryWrapper(bo);
        Page<CryptoCurrencyVo> result = cryptoCurrencyMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询数字货币列表
     */
    public List<CryptoCurrencyVo> queryList(CryptoCurrencyBo bo) {
        LambdaQueryWrapper<CryptoCurrency> lqw = buildQueryWrapper(bo);
        return cryptoCurrencyMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<CryptoCurrency> buildQueryWrapper(CryptoCurrencyBo bo) {
        LambdaQueryWrapper<CryptoCurrency> lqw = Wrappers.lambdaQuery();
        lqw.eq(StrUtil.isNotBlank(bo.getSymbol()), CryptoCurrency::getSymbol, bo.getSymbol());
        lqw.like(StrUtil.isNotBlank(bo.getName()), CryptoCurrency::getName, bo.getName());
        return lqw;
    }

    /**
     * 新增数字货币
     */
    public void insertByBo(CryptoCurrencyBo bo) {
        CryptoCurrency add = MapstructUtils.convert(bo, CryptoCurrency.class);
        cryptoCurrencyMapper.insert(add);
    }

    /**
     * 修改数字货币
     */
    public void updateByBo(CryptoCurrencyBo bo) {
        CryptoCurrency update = MapstructUtils.convert(bo, CryptoCurrency.class);
        cryptoCurrencyMapper.updateById(update);
    }

    /**
     * 删除数字货币
     */
    public void deleteById(Long id) {
        cryptoCurrencyMapper.deleteById(id);
    }

    /**
     * 批量删除数字货币
     */
    public void deleteByIds(Collection<Long> ids) {
        cryptoCurrencyMapper.deleteBatchIds(ids);
    }
}
