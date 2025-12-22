package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.Portfolio;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 持仓VO
 *
 * @author student
 */

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = Portfolio.class)
public class PortfolioVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

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
     * 持仓数量
     */
    @ExcelProperty(value = "持仓数量")
    private BigDecimal quantity;

    /**
     * 平均买入价格
     */
    @ExcelProperty(value = "平均买入价格")
    private BigDecimal avgPrice;

    /**
     * 当前市值
     */
    @ExcelProperty(value = "当前市值")
    private BigDecimal currentValue;

    /**
     * 配置比例（%）
     */
    @ExcelProperty(value = "配置比例")
    private BigDecimal allocationPercent;
}
