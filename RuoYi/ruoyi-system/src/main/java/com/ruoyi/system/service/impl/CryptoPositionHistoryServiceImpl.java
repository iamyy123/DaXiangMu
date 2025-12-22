package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CryptoPositionHistoryMapper;
import com.ruoyi.system.domain.CryptoPositionHistory;
import com.ruoyi.system.service.ICryptoPositionHistoryService;

/**
 * 持仓历史记录Service业务层处理
 * 
 * @author lhy
 * @date 2025-12-16
 */
@Service
public class CryptoPositionHistoryServiceImpl implements ICryptoPositionHistoryService 
{
    @Autowired
    private CryptoPositionHistoryMapper cryptoPositionHistoryMapper;

    /**
     * 查询持仓历史记录
     * 
     * @param id 持仓历史记录主键
     * @return 持仓历史记录
     */
    @Override
    public CryptoPositionHistory selectCryptoPositionHistoryById(Long id)
    {
        return cryptoPositionHistoryMapper.selectCryptoPositionHistoryById(id);
    }

    /**
     * 查询持仓历史记录列表
     * 
     * @param cryptoPositionHistory 持仓历史记录
     * @return 持仓历史记录
     */
    @Override
    public List<CryptoPositionHistory> selectCryptoPositionHistoryList(CryptoPositionHistory cryptoPositionHistory)
    {
        return cryptoPositionHistoryMapper.selectCryptoPositionHistoryList(cryptoPositionHistory);
    }

    /**
     * 新增持仓历史记录
     * 
     * @param cryptoPositionHistory 持仓历史记录
     * @return 结果
     */
    @Override
    public int insertCryptoPositionHistory(CryptoPositionHistory cryptoPositionHistory)
    {
        cryptoPositionHistory.setCreateTime(DateUtils.getNowDate());
        return cryptoPositionHistoryMapper.insertCryptoPositionHistory(cryptoPositionHistory);
    }

    /**
     * 修改持仓历史记录
     * 
     * @param cryptoPositionHistory 持仓历史记录
     * @return 结果
     */
    @Override
    public int updateCryptoPositionHistory(CryptoPositionHistory cryptoPositionHistory)
    {
        return cryptoPositionHistoryMapper.updateCryptoPositionHistory(cryptoPositionHistory);
    }

    /**
     * 批量删除持仓历史记录
     * 
     * @param ids 需要删除的持仓历史记录主键
     * @return 结果
     */
    @Override
    public int deleteCryptoPositionHistoryByIds(Long[] ids)
    {
        return cryptoPositionHistoryMapper.deleteCryptoPositionHistoryByIds(ids);
    }

    /**
     * 删除持仓历史记录信息
     * 
     * @param id 持仓历史记录主键
     * @return 结果
     */
    @Override
    public int deleteCryptoPositionHistoryById(Long id)
    {
        return cryptoPositionHistoryMapper.deleteCryptoPositionHistoryById(id);
    }
}
