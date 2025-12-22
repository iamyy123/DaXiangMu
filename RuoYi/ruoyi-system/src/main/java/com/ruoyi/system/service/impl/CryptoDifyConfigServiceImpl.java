package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CryptoDifyConfigMapper;
import com.ruoyi.system.domain.CryptoDifyConfig;
import com.ruoyi.system.service.ICryptoDifyConfigService;

/**
 * Dify智能体配置Service业务层处理
 * 
 * @author lhy
 * @date 2025-12-15
 */
@Service
public class CryptoDifyConfigServiceImpl implements ICryptoDifyConfigService 
{
    @Autowired
    private CryptoDifyConfigMapper cryptoDifyConfigMapper;

    /**
     * 查询Dify智能体配置
     * 
     * @param id Dify智能体配置主键
     * @return Dify智能体配置
     */
    @Override
    public CryptoDifyConfig selectCryptoDifyConfigById(Long id)
    {
        return cryptoDifyConfigMapper.selectCryptoDifyConfigById(id);
    }

    /**
     * 查询Dify智能体配置列表
     * 
     * @param cryptoDifyConfig Dify智能体配置
     * @return Dify智能体配置
     */
    @Override
    public List<CryptoDifyConfig> selectCryptoDifyConfigList(CryptoDifyConfig cryptoDifyConfig)
    {
        return cryptoDifyConfigMapper.selectCryptoDifyConfigList(cryptoDifyConfig);
    }

    /**
     * 新增Dify智能体配置
     * 
     * @param cryptoDifyConfig Dify智能体配置
     * @return 结果
     */
    @Override
    public int insertCryptoDifyConfig(CryptoDifyConfig cryptoDifyConfig)
    {
        cryptoDifyConfig.setCreateTime(DateUtils.getNowDate());
        return cryptoDifyConfigMapper.insertCryptoDifyConfig(cryptoDifyConfig);
    }

    /**
     * 修改Dify智能体配置
     * 
     * @param cryptoDifyConfig Dify智能体配置
     * @return 结果
     */
    @Override
    public int updateCryptoDifyConfig(CryptoDifyConfig cryptoDifyConfig)
    {
        cryptoDifyConfig.setUpdateTime(DateUtils.getNowDate());
        return cryptoDifyConfigMapper.updateCryptoDifyConfig(cryptoDifyConfig);
    }

    /**
     * 批量删除Dify智能体配置
     * 
     * @param ids 需要删除的Dify智能体配置主键
     * @return 结果
     */
    @Override
    public int deleteCryptoDifyConfigByIds(Long[] ids)
    {
        return cryptoDifyConfigMapper.deleteCryptoDifyConfigByIds(ids);
    }

    /**
     * 删除Dify智能体配置信息
     * 
     * @param id Dify智能体配置主键
     * @return 结果
     */
    @Override
    public int deleteCryptoDifyConfigById(Long id)
    {
        return cryptoDifyConfigMapper.deleteCryptoDifyConfigById(id);
    }
}
