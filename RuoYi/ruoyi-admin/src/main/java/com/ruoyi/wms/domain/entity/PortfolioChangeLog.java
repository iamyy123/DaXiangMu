package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 持仓变更记录表
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("portfolio_change_log")
public class PortfolioChangeLog extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id")
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
