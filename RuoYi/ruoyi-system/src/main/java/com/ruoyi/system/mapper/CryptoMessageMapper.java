package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.CryptoMessage;

/**
 * 数字货币消息Mapper接口
 * 
 * @author lhy
 * @date 2025-12-15
 */
public interface CryptoMessageMapper 
{
    /**
     * 查询数字货币消息
     * 
     * @param id 数字货币消息主键
     * @return 数字货币消息
     */
    public CryptoMessage selectCryptoMessageById(Long id);

    /**
     * 查询数字货币消息列表
     * 
     * @param cryptoMessage 数字货币消息
     * @return 数字货币消息集合
     */
    public List<CryptoMessage> selectCryptoMessageList(CryptoMessage cryptoMessage);

    /**
     * 新增数字货币消息
     * 
     * @param cryptoMessage 数字货币消息
     * @return 结果
     */
    public int insertCryptoMessage(CryptoMessage cryptoMessage);

    /**
     * 修改数字货币消息
     * 
     * @param cryptoMessage 数字货币消息
     * @return 结果
     */
    public int updateCryptoMessage(CryptoMessage cryptoMessage);

    /**
     * 删除数字货币消息
     * 
     * @param id 数字货币消息主键
     * @return 结果
     */
    public int deleteCryptoMessageById(Long id);

    /**
     * 批量删除数字货币消息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCryptoMessageByIds(Long[] ids);
}
