package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 数字货币消息对象 crypto_message
 * 
 * @author lhy
 * @date 2025-12-15
 */
public class CryptoMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 消息ID */
    private Long id;

    /** 数字货币类型（BTC/ETH/SOL等） */
    @Excel(name = "数字货币类型", readConverterExp = "B=TC/ETH/SOL等")
    private String coinType;

    /** 消息标题 */
    @Excel(name = "消息标题")
    private String title;

    /** 消息内容 */
    @Excel(name = "消息内容")
    private String content;

    /** 消息来源（CoinGecko/Binance等） */
    @Excel(name = "消息来源", readConverterExp = "C=oinGecko/Binance等")
    private String source;

    /** 原始链接 */
    @Excel(name = "原始链接")
    private String sourceUrl;

    /** 情感倾向（利好/利空/中性） */
    @Excel(name = "情感倾向", readConverterExp = "利=好/利空/中性")
    private String sentiment;

    /** 影响程度（1-5，5为最高） */
    @Excel(name = "影响程度", readConverterExp = "1=-5，5为最高")
    private Long impactLevel;

    /** AI第一次分析结果 */
    @Excel(name = "AI第一次分析结果")
    private String analysisResult;

    /** 采集时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "采集时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date collectTime;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

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

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setSource(String source) 
    {
        this.source = source;
    }

    public String getSource() 
    {
        return source;
    }

    public void setSourceUrl(String sourceUrl) 
    {
        this.sourceUrl = sourceUrl;
    }

    public String getSourceUrl() 
    {
        return sourceUrl;
    }

    public void setSentiment(String sentiment) 
    {
        this.sentiment = sentiment;
    }

    public String getSentiment() 
    {
        return sentiment;
    }

    public void setImpactLevel(long impactLevel)
    {
        this.impactLevel = impactLevel;
    }

    public Long getImpactLevel() 
    {
        return impactLevel;
    }

    public void setAnalysisResult(String analysisResult) 
    {
        this.analysisResult = analysisResult;
    }

    public String getAnalysisResult() 
    {
        return analysisResult;
    }

    public void setCollectTime(Date collectTime) 
    {
        this.collectTime = collectTime;
    }

    public Date getCollectTime() 
    {
        return collectTime;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("coinType", getCoinType())
            .append("title", getTitle())
            .append("content", getContent())
            .append("source", getSource())
            .append("sourceUrl", getSourceUrl())
            .append("sentiment", getSentiment())
            .append("impactLevel", getImpactLevel())
            .append("analysisResult", getAnalysisResult())
            .append("collectTime", getCollectTime())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("status", getStatus())
            .toString();
    }
}
