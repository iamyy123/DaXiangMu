package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 审核记录对象 crypto_review_log
 * 
 * @author ruoyi
 * @date 2025-12-15
 */
public class CryptoReviewLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 审核记录ID */
    private Long id;

    /** 报告ID */
    @Excel(name = "报告ID")
    private Long reportId;

    /** 审核人ID */
    @Excel(name = "审核人ID")
    private Long reviewerId;

    /** 审核人姓名 */
    @Excel(name = "审核人姓名")
    private String reviewerName;

    /** 审核结果（APPROVED/REJECTED） */
    @Excel(name = "审核结果", readConverterExp = "A=PPROVED/REJECTED")
    private String reviewResult;

    /** 审核意见 */
    @Excel(name = "审核意见")
    private String reviewComment;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reviewTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setReportId(Long reportId) 
    {
        this.reportId = reportId;
    }

    public Long getReportId() 
    {
        return reportId;
    }

    public void setReviewerId(Long reviewerId) 
    {
        this.reviewerId = reviewerId;
    }

    public Long getReviewerId() 
    {
        return reviewerId;
    }

    public void setReviewerName(String reviewerName) 
    {
        this.reviewerName = reviewerName;
    }

    public String getReviewerName() 
    {
        return reviewerName;
    }

    public void setReviewResult(String reviewResult) 
    {
        this.reviewResult = reviewResult;
    }

    public String getReviewResult() 
    {
        return reviewResult;
    }

    public void setReviewComment(String reviewComment) 
    {
        this.reviewComment = reviewComment;
    }

    public String getReviewComment() 
    {
        return reviewComment;
    }

    public void setReviewTime(Date reviewTime) 
    {
        this.reviewTime = reviewTime;
    }

    public Date getReviewTime() 
    {
        return reviewTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("reportId", getReportId())
            .append("reviewerId", getReviewerId())
            .append("reviewerName", getReviewerName())
            .append("reviewResult", getReviewResult())
            .append("reviewComment", getReviewComment())
            .append("reviewTime", getReviewTime())
            .toString();
    }
}
