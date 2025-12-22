package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.CryptoCurrency;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 数字货币基本信息业务对象
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = CryptoCurrency.class)
public class CryptoCurrencyBo extends BaseEntity {
    
    /**
     * 主键
     */
    private Long id;

    /**
     * 货币代码（如BTC、ETH）
     */
    private String symbol;

    /**
     * 货币名称
     */
    private String name;

    /**
     * 货币描述
     */
    private String description;

    /**
     * 当前价格（美元）
     */
    private BigDecimal currentPrice;

    /**
     * 市值
     */
    private BigDecimal marketCap;

    /**
     * 流通供应量
     */
    private BigDecimal circulatingSupply;

    /**
     * 最大供应量
     */
    private BigDecimal maxSupply;
}
