package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.CryptoPositionHistory;

/**
 * 持仓历史记录Service接口
 * 
 * @author lhy
 * @date 2025-12-16
 */
public interface ICryptoPositionHistoryService 
{
    /**
     * 查询持仓历史记录
     * 
     * @param id 持仓历史记录主键
     * @return 持仓历史记录
     */
    public CryptoPositionHistory selectCryptoPositionHistoryById(Long id);

    /**
     * 查询持仓历史记录列表
     * 
     * @param cryptoPositionHistory 持仓历史记录
     * @return 持仓历史记录集合
     */
    public List<CryptoPositionHistory> selectCryptoPositionHistoryList(CryptoPositionHistory cryptoPositionHistory);

    /**
     * 新增持仓历史记录
     * 
     * @param cryptoPositionHistory 持仓历史记录
     * @return 结果
     */
    public int insertCryptoPositionHistory(CryptoPositionHistory cryptoPositionHistory);

    /**
     * 修改持仓历史记录
     * 
     * @param cryptoPositionHistory 持仓历史记录
     * @return 结果
     */
    public int updateCryptoPositionHistory(CryptoPositionHistory cryptoPositionHistory);

    /**
     * 批量删除持仓历史记录
     * 
     * @param ids 需要删除的持仓历史记录主键集合
     * @return 结果
     */
    public int deleteCryptoPositionHistoryByIds(Long[] ids);

    /**
     * 删除持仓历史记录信息
     * 
     * @param id 持仓历史记录主键
     * @return 结果
     */
    public int deleteCryptoPositionHistoryById(Long id);
}
