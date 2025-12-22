package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.AllocationSuggestionDetail;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 配置建议详情VO
 *
 * @author student
 */

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = AllocationSuggestionDetail.class)
public class AllocationSuggestionDetailVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 配置建议ID
     */
    @ExcelProperty(value = "配置建议ID")
    private Long suggestionId;

    /**
     * 数字货币ID
     */
    @ExcelProperty(value = "数字货币ID")
    private Long currencyId;

    /**
     * 货币代码
     */
    @ExcelProperty(value = "货币代码")
    private String symbol;

    /**
     * 货币名称
     */
    @ExcelProperty(value = "货币名称")
    private String currencyName;

    /**
     * 目标数量
     */
    @ExcelProperty(value = "目标数量")
    private BigDecimal targetQuantity;

    /**
     * 目标配置比例（%）
     */
    @ExcelProperty(value = "目标配置比例")
    private BigDecimal targetAllocation;

    /**
     * 当前数量
     */
    @ExcelProperty(value = "当前数量")
    private BigDecimal currentQuantity;

    /**
     * 变动数量
     */
    @ExcelProperty(value = "变动数量")
    private BigDecimal changeQuantity;

    /**
     * 变动类型（1：买入，-1：卖出，0：不变）
     */
    @ExcelProperty(value = "变动类型")
    private Integer changeType;

    /**
     * 变动类型描述
     */
    @ExcelProperty(value = "变动类型描述")
    private String changeTypeDesc;
}
