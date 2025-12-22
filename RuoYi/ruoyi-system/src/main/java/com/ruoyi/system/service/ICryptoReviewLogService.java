package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.CryptoReviewLog;

/**
 * 审核记录Service接口
 * 
 * @author ruoyi
 * @date 2025-12-15
 */
public interface ICryptoReviewLogService 
{
    /**
     * 查询审核记录
     * 
     * @param id 审核记录主键
     * @return 审核记录
     */
    public CryptoReviewLog selectCryptoReviewLogById(Long id);

    /**
     * 查询审核记录列表
     * 
     * @param cryptoReviewLog 审核记录
     * @return 审核记录集合
     */
    public List<CryptoReviewLog> selectCryptoReviewLogList(CryptoReviewLog cryptoReviewLog);

    /**
     * 新增审核记录
     * 
     * @param cryptoReviewLog 审核记录
     * @return 结果
     */
    public int insertCryptoReviewLog(CryptoReviewLog cryptoReviewLog);

    /**
     * 修改审核记录
     * 
     * @param cryptoReviewLog 审核记录
     * @return 结果
     */
    public int updateCryptoReviewLog(CryptoReviewLog cryptoReviewLog);

    /**
     * 批量删除审核记录
     * 
     * @param ids 需要删除的审核记录主键集合
     * @return 结果
     */
    public int deleteCryptoReviewLogByIds(Long[] ids);

    /**
     * 删除审核记录信息
     * 
     * @param id 审核记录主键
     * @return 结果
     */
    public int deleteCryptoReviewLogById(Long id);
}
