package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.AllocationSuggestion;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * 资产配置建议业务对象
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = AllocationSuggestion.class)
public class AllocationSuggestionBo extends BaseEntity {
    
    /**
     * 主键
     */
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

    /**
     * 配置建议详情列表
     */
    private List<AllocationSuggestionDetailBo> detailList;
}
