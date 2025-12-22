package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.CryptoCollectLog;

/**
 * 消息采集任务日志Service接口
 * 
 * @author ruoyi
 * @date 2025-12-19
 */
public interface ICryptoCollectLogService 
{
    /**
     * 查询消息采集任务日志
     * 
     * @param id 消息采集任务日志主键
     * @return 消息采集任务日志
     */
    public CryptoCollectLog selectCryptoCollectLogById(Long id);

    /**
     * 查询消息采集任务日志列表
     * 
     * @param cryptoCollectLog 消息采集任务日志
     * @return 消息采集任务日志集合
     */
    public List<CryptoCollectLog> selectCryptoCollectLogList(CryptoCollectLog cryptoCollectLog);

    /**
     * 新增消息采集任务日志
     * 
     * @param cryptoCollectLog 消息采集任务日志
     * @return 结果
     */
    public int insertCryptoCollectLog(CryptoCollectLog cryptoCollectLog);

    /**
     * 修改消息采集任务日志
     * 
     * @param cryptoCollectLog 消息采集任务日志
     * @return 结果
     */
    public int updateCryptoCollectLog(CryptoCollectLog cryptoCollectLog);

    /**
     * 批量删除消息采集任务日志
     * 
     * @param ids 需要删除的消息采集任务日志主键集合
     * @return 结果
     */
    public int deleteCryptoCollectLogByIds(Long[] ids);

    /**
     * 删除消息采集任务日志信息
     * 
     * @param id 消息采集任务日志主键
     * @return 结果
     */
    public int deleteCryptoCollectLogById(Long id);
}
