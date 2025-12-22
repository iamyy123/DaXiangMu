package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

/**
 * 配置建议详情表
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("allocation_suggestion_detail")
public class AllocationSuggestionDetail extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 配置建议ID
     */
    private Long suggestionId;

    /**
     * 数字货币ID
     */
    private Long currencyId;

    /**
     * 目标数量
     */
    private BigDecimal targetQuantity;

    /**
     * 目标配置比例（%）
     */
    private BigDecimal targetAllocation;

    /**
     * 当前数量
     */
    private BigDecimal currentQuantity;

    /**
     * 变动数量
     */
    private BigDecimal changeQuantity;

    /**
     * 变动类型（1：买入，-1：卖出，0：不变）
     */
    private Integer changeType;
}
