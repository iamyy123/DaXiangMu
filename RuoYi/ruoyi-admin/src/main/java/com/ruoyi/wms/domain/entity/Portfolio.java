package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

/**
 * 持仓表
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("portfolio")
public class Portfolio extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 数字货币ID
     */
    private Long currencyId;

    /**
     * 持仓数量
     */
    private BigDecimal quantity;

    /**
     * 平均买入价格
     */
    private BigDecimal avgPrice;

    /**
     * 当前市值
     */
    private BigDecimal currentValue;

    /**
     * 配置比例（%）
     */
    private BigDecimal allocationPercent;
}
