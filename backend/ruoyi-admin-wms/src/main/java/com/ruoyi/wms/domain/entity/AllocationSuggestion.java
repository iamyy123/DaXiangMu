package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * 资产配置建议表
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("allocation_suggestion")
public class AllocationSuggestion extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 建议日期
     */
    private LocalDate suggestionDate;

    /**
     * 总市值
     */
    private BigDecimal totalValue;

    /**
     * AI分析结果
     */
    private String aiAnalysis;

    /**
     * 状态（0：待审核，1：已通过，2：已拒绝）
     */
    private Integer status;
}
