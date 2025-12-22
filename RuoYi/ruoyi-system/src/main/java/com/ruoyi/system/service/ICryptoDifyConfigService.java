package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.CryptoDifyConfig;

/**
 * Dify智能体配置Service接口
 * 
 * @author lhy
 * @date 2025-12-15
 */
public interface ICryptoDifyConfigService 
{
    /**
     * 查询Dify智能体配置
     * 
     * @param id Dify智能体配置主键
     * @return Dify智能体配置
     */
    public CryptoDifyConfig selectCryptoDifyConfigById(Long id);

    /**
     * 查询Dify智能体配置列表
     * 
     * @param cryptoDifyConfig Dify智能体配置
     * @return Dify智能体配置集合
     */
    public List<CryptoDifyConfig> selectCryptoDifyConfigList(CryptoDifyConfig cryptoDifyConfig);

    /**
     * 新增Dify智能体配置
     * 
     * @param cryptoDifyConfig Dify智能体配置
     * @return 结果
     */
    public int insertCryptoDifyConfig(CryptoDifyConfig cryptoDifyConfig);

    /**
     * 修改Dify智能体配置
     * 
     * @param cryptoDifyConfig Dify智能体配置
     * @return 结果
     */
    public int updateCryptoDifyConfig(CryptoDifyConfig cryptoDifyConfig);

    /**
     * 批量删除Dify智能体配置
     * 
     * @param ids 需要删除的Dify智能体配置主键集合
     * @return 结果
     */
    public int deleteCryptoDifyConfigByIds(Long[] ids);

    /**
     * 删除Dify智能体配置信息
     * 
     * @param id Dify智能体配置主键
     * @return 结果
     */
    public int deleteCryptoDifyConfigById(Long id);
}
