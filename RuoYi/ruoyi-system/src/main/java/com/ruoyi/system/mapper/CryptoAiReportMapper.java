package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.CryptoAiReport;

/**
 * AI分析报告Mapper接口
 * 
 * @author lhy
 * @date 2025-12-16
 */
public interface CryptoAiReportMapper 
{
    /**
     * 查询AI分析报告
     * 
     * @param id AI分析报告主键
     * @return AI分析报告
     */
    public CryptoAiReport selectCryptoAiReportById(Long id);

    /**
     * 查询AI分析报告列表
     * 
     * @param cryptoAiReport AI分析报告
     * @return AI分析报告集合
     */
    public List<CryptoAiReport> selectCryptoAiReportList(CryptoAiReport cryptoAiReport);

    /**
     * 新增AI分析报告
     * 
     * @param cryptoAiReport AI分析报告
     * @return 结果
     */
    public int insertCryptoAiReport(CryptoAiReport cryptoAiReport);

    /**
     * 修改AI分析报告
     * 
     * @param cryptoAiReport AI分析报告
     * @return 结果
     */
    public int updateCryptoAiReport(CryptoAiReport cryptoAiReport);

    /**
     * 删除AI分析报告
     * 
     * @param id AI分析报告主键
     * @return 结果
     */
    public int deleteCryptoAiReportById(Long id);

    /**
     * 批量删除AI分析报告
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCryptoAiReportByIds(Long[] ids);
}
