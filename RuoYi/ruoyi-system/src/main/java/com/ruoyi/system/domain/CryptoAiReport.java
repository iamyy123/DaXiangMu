package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * AI分析报告对象 crypto_ai_report
 * 
 * @author lhy
 * @date 2025-12-16
 */
public class CryptoAiReport extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 报告ID */
    private Long id;

    /** 关联消息ID */
    @Excel(name = "关联消息ID")
    private Long messageId;

    /** 报告日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "报告日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reportDate;

    /** 第一次分析结果（消息情感分析） */
    @Excel(name = "第一次分析结果", readConverterExp = "消=息情感分析")
    private String firstAnalysis;

    /** 持仓快照（JSON格式） */
    @Excel(name = "持仓快照", readConverterExp = "J=SON格式")
    private String positionSnapshot;

    /** 第二次分析结果（持仓匹配分析） */
    @Excel(name = "第二次分析结果", readConverterExp = "持=仓匹配分析")
    private String secondAnalysis;

    /** 调整建议（JSON格式） */
    @Excel(name = "调整建议", readConverterExp = "J=SON格式")
    private String adjustmentSuggestion;

    /** 分析依据 */
    @Excel(name = "分析依据")
    private String analysisBasis;

    /** 报告状态（PENDING待审核/APPROVED已通过/REJECTED已驳回） */
    @Excel(name = "报告状态", readConverterExp = "P=ENDING待审核/APPROVED已通过/REJECTED已驳回")
    private String reportStatus;

    /** 审核人ID */
    @Excel(name = "审核人ID")
    private Long reviewerId;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reviewTime;

    /** 驳回原因 */
    @Excel(name = "驳回原因")
    private String rejectReason;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setMessageId(Long messageId) 
    {
        this.messageId = messageId;
    }

    public Long getMessageId() 
    {
        return messageId;
    }

    public void setReportDate(Date reportDate) 
    {
        this.reportDate = reportDate;
    }

    public Date getReportDate() 
    {
        return reportDate;
    }

    public void setFirstAnalysis(String firstAnalysis) 
    {
        this.firstAnalysis = firstAnalysis;
    }

    public String getFirstAnalysis() 
    {
        return firstAnalysis;
    }

    public void setPositionSnapshot(String positionSnapshot) 
    {
        this.positionSnapshot = positionSnapshot;
    }

    public String getPositionSnapshot() 
    {
        return positionSnapshot;
    }

    public void setSecondAnalysis(String secondAnalysis) 
    {
        this.secondAnalysis = secondAnalysis;
    }

    public String getSecondAnalysis() 
    {
        return secondAnalysis;
    }

    public void setAdjustmentSuggestion(String adjustmentSuggestion) 
    {
        this.adjustmentSuggestion = adjustmentSuggestion;
    }

    public String getAdjustmentSuggestion() 
    {
        return adjustmentSuggestion;
    }

    public void setAnalysisBasis(String analysisBasis) 
    {
        this.analysisBasis = analysisBasis;
    }

    public String getAnalysisBasis() 
    {
        return analysisBasis;
    }

    public void setReportStatus(String reportStatus) 
    {
        this.reportStatus = reportStatus;
    }

    public String getReportStatus() 
    {
        return reportStatus;
    }

    public void setReviewerId(Long reviewerId) 
    {
        this.reviewerId = reviewerId;
    }

    public Long getReviewerId() 
    {
        return reviewerId;
    }

    public void setReviewTime(Date reviewTime) 
    {
        this.reviewTime = reviewTime;
    }

    public Date getReviewTime() 
    {
        return reviewTime;
    }

    public void setRejectReason(String rejectReason) 
    {
        this.rejectReason = rejectReason;
    }

    public String getRejectReason() 
    {
        return rejectReason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("messageId", getMessageId())
            .append("reportDate", getReportDate())
            .append("firstAnalysis", getFirstAnalysis())
            .append("positionSnapshot", getPositionSnapshot())
            .append("secondAnalysis", getSecondAnalysis())
            .append("adjustmentSuggestion", getAdjustmentSuggestion())
            .append("analysisBasis", getAnalysisBasis())
            .append("reportStatus", getReportStatus())
            .append("reviewerId", getReviewerId())
            .append("reviewTime", getReviewTime())
            .append("rejectReason", getRejectReason())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
