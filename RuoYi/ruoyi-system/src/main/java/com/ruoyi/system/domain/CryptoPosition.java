package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 持仓数据对象 crypto_position
 * 
 * @author lhy
 * @date 2025-12-16
 */
public class CryptoPosition extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 持仓ID */
    private Long id;

    /** 数字货币类型 */
    @Excel(name = "数字货币类型")
    private String coinType;

    /** 持仓数量 */
    @Excel(name = "持仓数量")
    private BigDecimal amount;

    /** 持仓占比（百分比） */
    @Excel(name = "持仓占比", readConverterExp = "百=分比")
    private BigDecimal percentage;

    /** 美元价值 */
    @Excel(name = "美元价值")
    private BigDecimal usdValue;

    /** 当前价格（USD） */
    @Excel(name = "当前价格", readConverterExp = "U=SD")
    private BigDecimal price;

    /** 快照日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "快照日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date snapshotDate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setCoinType(String coinType) 
    {
        this.coinType = coinType;
    }

    public String getCoinType() 
    {
        return coinType;
    }

    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }

    public void setPercentage(BigDecimal percentage) 
    {
        this.percentage = percentage;
    }

    public BigDecimal getPercentage() 
    {
        return percentage;
    }

    public void setUsdValue(BigDecimal usdValue) 
    {
        this.usdValue = usdValue;
    }

    public BigDecimal getUsdValue() 
    {
        return usdValue;
    }

    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }

    public void setSnapshotDate(Date snapshotDate) 
    {
        this.snapshotDate = snapshotDate;
    }

    public Date getSnapshotDate() 
    {
        return snapshotDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("coinType", getCoinType())
            .append("amount", getAmount())
            .append("percentage", getPercentage())
            .append("usdValue", getUsdValue())
            .append("price", getPrice())
            .append("snapshotDate", getSnapshotDate())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
