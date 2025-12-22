package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CryptoMessageMapper;
import com.ruoyi.system.domain.CryptoMessage;
import com.ruoyi.system.service.ICryptoMessageService;

/**
 * 数字货币消息Service业务层处理
 * 
 * @author lhy
 * @date 2025-12-15
 */
@Service
public class CryptoMessageServiceImpl implements ICryptoMessageService 
{
    @Autowired
    private CryptoMessageMapper cryptoMessageMapper;

    /**
     * 查询数字货币消息
     * 
     * @param id 数字货币消息主键
     * @return 数字货币消息
     */
    @Override
    public CryptoMessage selectCryptoMessageById(Long id)
    {
        return cryptoMessageMapper.selectCryptoMessageById(id);
    }

    /**
     * 查询数字货币消息列表
     * 
     * @param cryptoMessage 数字货币消息
     * @return 数字货币消息
     */
    @Override
    public List<CryptoMessage> selectCryptoMessageList(CryptoMessage cryptoMessage)
    {
        return cryptoMessageMapper.selectCryptoMessageList(cryptoMessage);
    }

    /**
     * 新增数字货币消息
     * 
     * @param cryptoMessage 数字货币消息
     * @return 结果
     */
    @Override
    public int insertCryptoMessage(CryptoMessage cryptoMessage)
    {
        cryptoMessage.setCreateTime(DateUtils.getNowDate());
        return cryptoMessageMapper.insertCryptoMessage(cryptoMessage);
    }

    /**
     * 修改数字货币消息
     * 
     * @param cryptoMessage 数字货币消息
     * @return 结果
     */
    @Override
    public int updateCryptoMessage(CryptoMessage cryptoMessage)
    {
        cryptoMessage.setUpdateTime(DateUtils.getNowDate());
        return cryptoMessageMapper.updateCryptoMessage(cryptoMessage);
    }

    /**
     * 批量删除数字货币消息
     * 
     * @param ids 需要删除的数字货币消息主键
     * @return 结果
     */
    @Override
    public int deleteCryptoMessageByIds(Long[] ids)
    {
        return cryptoMessageMapper.deleteCryptoMessageByIds(ids);
    }

    /**
     * 删除数字货币消息信息
     * 
     * @param id 数字货币消息主键
     * @return 结果
     */
    @Override
    public int deleteCryptoMessageById(Long id)
    {
        return cryptoMessageMapper.deleteCryptoMessageById(id);
    }
}
