package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.AllocationSuggestionDetail;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 配置建议详情业务对象
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = AllocationSuggestionDetail.class)
public class AllocationSuggestionDetailBo extends BaseEntity {
    
    /**
     * 主键
     */
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
