package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CryptoCollectLogMapper;
import com.ruoyi.system.domain.CryptoCollectLog;
import com.ruoyi.system.service.ICryptoCollectLogService;

/**
 * 消息采集任务日志Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-19
 */
@Service
public class CryptoCollectLogServiceImpl implements ICryptoCollectLogService 
{
    @Autowired
    private CryptoCollectLogMapper cryptoCollectLogMapper;

    /**
     * 查询消息采集任务日志
     * 
     * @param id 消息采集任务日志主键
     * @return 消息采集任务日志
     */
    @Override
    public CryptoCollectLog selectCryptoCollectLogById(Long id)
    {
        return cryptoCollectLogMapper.selectCryptoCollectLogById(id);
    }

    /**
     * 查询消息采集任务日志列表
     * 
     * @param cryptoCollectLog 消息采集任务日志
     * @return 消息采集任务日志
     */
    @Override
    public List<CryptoCollectLog> selectCryptoCollectLogList(CryptoCollectLog cryptoCollectLog)
    {
        return cryptoCollectLogMapper.selectCryptoCollectLogList(cryptoCollectLog);
    }

    /**
     * 新增消息采集任务日志
     * 
     * @param cryptoCollectLog 消息采集任务日志
     * @return 结果
     */
    @Override
    public int insertCryptoCollectLog(CryptoCollectLog cryptoCollectLog)
    {
        return cryptoCollectLogMapper.insertCryptoCollectLog(cryptoCollectLog);
    }

    /**
     * 修改消息采集任务日志
     * 
     * @param cryptoCollectLog 消息采集任务日志
     * @return 结果
     */
    @Override
    public int updateCryptoCollectLog(CryptoCollectLog cryptoCollectLog)
    {
        return cryptoCollectLogMapper.updateCryptoCollectLog(cryptoCollectLog);
    }

    /**
     * 批量删除消息采集任务日志
     * 
     * @param ids 需要删除的消息采集任务日志主键
     * @return 结果
     */
    @Override
    public int deleteCryptoCollectLogByIds(Long[] ids)
    {
        return cryptoCollectLogMapper.deleteCryptoCollectLogByIds(ids);
    }

    /**
     * 删除消息采集任务日志信息
     * 
     * @param id 消息采集任务日志主键
     * @return 结果
     */
    @Override
    public int deleteCryptoCollectLogById(Long id)
    {
        return cryptoCollectLogMapper.deleteCryptoCollectLogById(id);
    }
}
