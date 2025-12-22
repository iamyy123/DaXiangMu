package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.AllocationSuggestion;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

/**
 * 资产配置建议VO
 *
 * @author student
 */

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = AllocationSuggestion.class)
public class AllocationSuggestionVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 建议日期
     */
    @ExcelProperty(value = "建议日期")
    private LocalDate suggestionDate;

    /**
     * 总市值
     */
    @ExcelProperty(value = "总市值")
    private BigDecimal totalValue;

    /**
     * AI分析结果
     */
    @ExcelProperty(value = "AI分析结果")
    private String aiAnalysis;

    /**
     * 状态（0：待审核，1：已通过，2：已拒绝）
     */
    @ExcelProperty(value = "状态")
    private Integer status;

    /**
     * 状态描述
     */
    @ExcelProperty(value = "状态描述")
    private String statusDesc;

    /**
     * 配置建议详情列表
     */
    private List<AllocationSuggestionDetailVo> detailList;
}
