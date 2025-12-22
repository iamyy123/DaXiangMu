package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CryptoAiReportMapper;
import com.ruoyi.system.domain.CryptoAiReport;
import com.ruoyi.system.service.ICryptoAiReportService;

/**
 * AI分析报告Service业务层处理
 * 
 * @author lhy
 * @date 2025-12-16
 */
@Service
public class CryptoAiReportServiceImpl implements ICryptoAiReportService 
{
    @Autowired
    private CryptoAiReportMapper cryptoAiReportMapper;

    /**
     * 查询AI分析报告
     * 
     * @param id AI分析报告主键
     * @return AI分析报告
     */
    @Override
    public CryptoAiReport selectCryptoAiReportById(Long id)
    {
        return cryptoAiReportMapper.selectCryptoAiReportById(id);
    }

    /**
     * 查询AI分析报告列表
     * 
     * @param cryptoAiReport AI分析报告
     * @return AI分析报告
     */
    @Override
    public List<CryptoAiReport> selectCryptoAiReportList(CryptoAiReport cryptoAiReport)
    {
        return cryptoAiReportMapper.selectCryptoAiReportList(cryptoAiReport);
    }

    /**
     * 新增AI分析报告
     * 
     * @param cryptoAiReport AI分析报告
     * @return 结果
     */
    @Override
    public int insertCryptoAiReport(CryptoAiReport cryptoAiReport)
    {
        cryptoAiReport.setCreateTime(DateUtils.getNowDate());
        return cryptoAiReportMapper.insertCryptoAiReport(cryptoAiReport);
    }

    /**
     * 修改AI分析报告
     * 
     * @param cryptoAiReport AI分析报告
     * @return 结果
     */
    @Override
    public int updateCryptoAiReport(CryptoAiReport cryptoAiReport)
    {
        cryptoAiReport.setUpdateTime(DateUtils.getNowDate());
        return cryptoAiReportMapper.updateCryptoAiReport(cryptoAiReport);
    }

    /**
     * 批量删除AI分析报告
     * 
     * @param ids 需要删除的AI分析报告主键
     * @return 结果
     */
    @Override
    public int deleteCryptoAiReportByIds(Long[] ids)
    {
        return cryptoAiReportMapper.deleteCryptoAiReportByIds(ids);
    }

    /**
     * 删除AI分析报告信息
     * 
     * @param id AI分析报告主键
     * @return 结果
     */
    @Override
    public int deleteCryptoAiReportById(Long id)
    {
        return cryptoAiReportMapper.deleteCryptoAiReportById(id);
    }
}
