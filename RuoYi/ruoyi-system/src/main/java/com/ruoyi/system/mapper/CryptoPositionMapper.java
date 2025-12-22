package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.CryptoPosition;

/**
 * 持仓数据Mapper接口
 * 
 * @author lhy
 * @date 2025-12-16
 */
public interface CryptoPositionMapper 
{
    /**
     * 查询持仓数据
     * 
     * @param id 持仓数据主键
     * @return 持仓数据
     */
    public CryptoPosition selectCryptoPositionById(Long id);

    /**
     * 查询持仓数据列表
     * 
     * @param cryptoPosition 持仓数据
     * @return 持仓数据集合
     */
    public List<CryptoPosition> selectCryptoPositionList(CryptoPosition cryptoPosition);

    /**
     * 新增持仓数据
     * 
     * @param cryptoPosition 持仓数据
     * @return 结果
     */
    public int insertCryptoPosition(CryptoPosition cryptoPosition);

    /**
     * 修改持仓数据
     * 
     * @param cryptoPosition 持仓数据
     * @return 结果
     */
    public int updateCryptoPosition(CryptoPosition cryptoPosition);

    /**
     * 删除持仓数据
     * 
     * @param id 持仓数据主键
     * @return 结果
     */
    public int deleteCryptoPositionById(Long id);

    /**
     * 批量删除持仓数据
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCryptoPositionByIds(Long[] ids);
}
