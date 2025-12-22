package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CryptoReviewLogMapper;
import com.ruoyi.system.domain.CryptoReviewLog;
import com.ruoyi.system.service.ICryptoReviewLogService;

/**
 * 审核记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-15
 */
@Service
public class CryptoReviewLogServiceImpl implements ICryptoReviewLogService 
{
    @Autowired
    private CryptoReviewLogMapper cryptoReviewLogMapper;

    /**
     * 查询审核记录
     * 
     * @param id 审核记录主键
     * @return 审核记录
     */
    @Override
    public CryptoReviewLog selectCryptoReviewLogById(Long id)
    {
        return cryptoReviewLogMapper.selectCryptoReviewLogById(id);
    }

    /**
     * 查询审核记录列表
     * 
     * @param cryptoReviewLog 审核记录
     * @return 审核记录
     */
    @Override
    public List<CryptoReviewLog> selectCryptoReviewLogList(CryptoReviewLog cryptoReviewLog)
    {
        return cryptoReviewLogMapper.selectCryptoReviewLogList(cryptoReviewLog);
    }

    /**
     * 新增审核记录
     * 
     * @param cryptoReviewLog 审核记录
     * @return 结果
     */
    @Override
    public int insertCryptoReviewLog(CryptoReviewLog cryptoReviewLog)
    {
        return cryptoReviewLogMapper.insertCryptoReviewLog(cryptoReviewLog);
    }

    /**
     * 修改审核记录
     * 
     * @param cryptoReviewLog 审核记录
     * @return 结果
     */
    @Override
    public int updateCryptoReviewLog(CryptoReviewLog cryptoReviewLog)
    {
        return cryptoReviewLogMapper.updateCryptoReviewLog(cryptoReviewLog);
    }

    /**
     * 批量删除审核记录
     * 
     * @param ids 需要删除的审核记录主键
     * @return 结果
     */
    @Override
    public int deleteCryptoReviewLogByIds(Long[] ids)
    {
        return cryptoReviewLogMapper.deleteCryptoReviewLogByIds(ids);
    }

    /**
     * 删除审核记录信息
     * 
     * @param id 审核记录主键
     * @return 结果
     */
    @Override
    public int deleteCryptoReviewLogById(Long id)
    {
        return cryptoReviewLogMapper.deleteCryptoReviewLogById(id);
    }
}
