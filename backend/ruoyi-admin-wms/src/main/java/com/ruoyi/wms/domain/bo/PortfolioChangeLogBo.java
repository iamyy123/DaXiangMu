package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.PortfolioChangeLog;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 持仓变更记录业务对象
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = PortfolioChangeLog.class)
public class PortfolioChangeLogBo extends BaseEntity {
    
    /**
     * 主键
     */
    private Long id;

    /**
     * 持仓ID
     */
    private Long portfolioId;

    /**
     * 数字货币ID
     */
    private Long currencyId;

    /**
     * 变更前数量
     */
    private BigDecimal beforeQuantity;

    /**
     * 变更后数量
     */
    private BigDecimal afterQuantity;

    /**
     * 变更前平均价格
     */
    private BigDecimal beforeAvgPrice;

    /**
     * 变更后平均价格
     */
    private BigDecimal afterAvgPrice;

    /**
     * 变更原因
     */
    private String changeReason;

    /**
     * 变更时间
     */
    private LocalDateTime changeTime;

    /**
     * 操作人ID
     */
    private Long operatorId;

    /**
     * 操作人姓名
     */
    private String operatorName;
}
