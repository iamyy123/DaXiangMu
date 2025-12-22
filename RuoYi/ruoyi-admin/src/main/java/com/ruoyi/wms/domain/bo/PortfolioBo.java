package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.Portfolio;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 持仓业务对象
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = Portfolio.class)
public class PortfolioBo extends BaseEntity {
    
    /**
     * 主键
     */
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
