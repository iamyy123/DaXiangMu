package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CryptoPositionMapper;
import com.ruoyi.system.domain.CryptoPosition;
import com.ruoyi.system.service.ICryptoPositionService;

/**
 * 持仓数据Service业务层处理
 * 
 * @author lhy
 * @date 2025-12-16
 */
@Service
public class CryptoPositionServiceImpl implements ICryptoPositionService 
{
    @Autowired
    private CryptoPositionMapper cryptoPositionMapper;

    /**
     * 查询持仓数据
     * 
     * @param id 持仓数据主键
     * @return 持仓数据
     */
    @Override
    public CryptoPosition selectCryptoPositionById(Long id)
    {
        return cryptoPositionMapper.selectCryptoPositionById(id);
    }

    /**
     * 查询持仓数据列表
     * 
     * @param cryptoPosition 持仓数据
     * @return 持仓数据
     */
    @Override
    public List<CryptoPosition> selectCryptoPositionList(CryptoPosition cryptoPosition)
    {
        return cryptoPositionMapper.selectCryptoPositionList(cryptoPosition);
    }

    /**
     * 新增持仓数据
     * 
     * @param cryptoPosition 持仓数据
     * @return 结果
     */
    @Override
    public int insertCryptoPosition(CryptoPosition cryptoPosition)
    {
        cryptoPosition.setCreateTime(DateUtils.getNowDate());
        return cryptoPositionMapper.insertCryptoPosition(cryptoPosition);
    }

    /**
     * 修改持仓数据
     * 
     * @param cryptoPosition 持仓数据
     * @return 结果
     */
    @Override
    public int updateCryptoPosition(CryptoPosition cryptoPosition)
    {
        cryptoPosition.setUpdateTime(DateUtils.getNowDate());
        return cryptoPositionMapper.updateCryptoPosition(cryptoPosition);
    }

    /**
     * 批量删除持仓数据
     * 
     * @param ids 需要删除的持仓数据主键
     * @return 结果
     */
    @Override
    public int deleteCryptoPositionByIds(Long[] ids)
    {
        return cryptoPositionMapper.deleteCryptoPositionByIds(ids);
    }

    /**
     * 删除持仓数据信息
     * 
     * @param id 持仓数据主键
     * @return 结果
     */
    @Override
    public int deleteCryptoPositionById(Long id)
    {
        return cryptoPositionMapper.deleteCryptoPositionById(id);
    }
}
