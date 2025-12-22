package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.CryptoCurrency;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 数字货币基本信息VO
 *
 * @author student
 */

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = CryptoCurrency.class)
public class CryptoCurrencyVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 货币代码（如BTC、ETH）
     */
    @ExcelProperty(value = "货币代码")
    private String symbol;

    /**
     * 货币名称
     */
    @ExcelProperty(value = "货币名称")
    private String name;

    /**
     * 货币描述
     */
    @ExcelProperty(value = "货币描述")
    private String description;

    /**
     * 当前价格（美元）
     */
    @ExcelProperty(value = "当前价格")
    private BigDecimal currentPrice;

    /**
     * 市值
     */
    @ExcelProperty(value = "市值")
    private BigDecimal marketCap;

    /**
     * 流通供应量
     */
    @ExcelProperty(value = "流通供应量")
    private BigDecimal circulatingSupply;

    /**
     * 最大供应量
     */
    @ExcelProperty(value = "最大供应量")
    private BigDecimal maxSupply;
}
