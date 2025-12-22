package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.CryptoReviewLog;

/**
 * 审核记录Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-15
 */
public interface CryptoReviewLogMapper 
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
     * 删除审核记录
     * 
     * @param id 审核记录主键
     * @return 结果
     */
    public int deleteCryptoReviewLogById(Long id);

    /**
     * 批量删除审核记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCryptoReviewLogByIds(Long[] ids);
}
