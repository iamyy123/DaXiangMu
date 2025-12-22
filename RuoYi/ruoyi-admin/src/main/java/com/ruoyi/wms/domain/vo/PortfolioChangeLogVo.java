package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.PortfolioChangeLog;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 持仓变更记录VO
 *
 * @author student
 */

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = PortfolioChangeLog.class)
public class PortfolioChangeLogVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 持仓ID
     */
    @ExcelProperty(value = "持仓ID")
    private Long portfolioId;

    /**
     * 数字货币ID
     */
    @ExcelProperty(value = "数字货币ID")
    private Long currencyId;

    /**
     * 数字货币名称
     */
    @ExcelProperty(value = "数字货币名称")
    private String currencyName;

    /**
     * 数字货币代码
     */
    @ExcelProperty(value = "数字货币代码")
    private String currencySymbol;

    /**
     * 变更前数量
     */
    @ExcelProperty(value = "变更前数量")
    private BigDecimal beforeQuantity;

    /**
     * 变更后数量
     */
    @ExcelProperty(value = "变更后数量")
    private BigDecimal afterQuantity;

    /**
     * 变更数量
     */
    @ExcelProperty(value = "变更数量")
    private BigDecimal changeQuantity;

    /**
     * 变更前平均价格
     */
    @ExcelProperty(value = "变更前平均价格")
    private BigDecimal beforeAvgPrice;

    /**
     * 变更后平均价格
     */
    @ExcelProperty(value = "变更后平均价格")
    private BigDecimal afterAvgPrice;

    /**
     * 变更原因
     */
    @ExcelProperty(value = "变更原因")
    private String changeReason;

    /**
     * 变更时间
     */
    @ExcelProperty(value = "变更时间")
    private LocalDateTime changeTime;

    /**
     * 操作人ID
     */
    @ExcelProperty(value = "操作人ID")
    private Long operatorId;

    /**
     * 操作人姓名
     */
    @ExcelProperty(value = "操作人姓名")
    private String operatorName;
}
