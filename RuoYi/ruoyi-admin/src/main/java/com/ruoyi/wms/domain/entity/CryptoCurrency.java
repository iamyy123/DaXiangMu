package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 数字货币基本信息表
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("crypto_currency")
public class CryptoCurrency extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id")
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
