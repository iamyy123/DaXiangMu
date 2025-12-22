package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 消息采集任务日志对象 crypto_collect_log
 * 
 * @author ruoyi
 * @date 2025-12-19
 */
public class CryptoCollectLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 日志ID */
    private Long id;

    /** 任务日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "任务日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date taskDate;

    /** 采集状态（SUCCESS/FAILED/RETRY） */
    @Excel(name = "采集状态", readConverterExp = "S=UCCESS/FAILED/RETRY")
    private String collectStatus;

    /** 采集消息数量 */
    @Excel(name = "采集消息数量")
    private Long messageCount;

    /** 错误信息 */
    @Excel(name = "错误信息")
    private String errorMessage;

    /** 重试次数 */
    @Excel(name = "重试次数")
    private Long retryCount;

    /** 执行时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "执行时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date executeTime;

    /** 执行时长（毫秒） */
    @Excel(name = "执行时长", readConverterExp = "毫=秒")
    private Long duration;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setTaskDate(Date taskDate) 
    {
        this.taskDate = taskDate;
    }

    public Date getTaskDate() 
    {
        return taskDate;
    }

    public void setCollectStatus(String collectStatus) 
    {
        this.collectStatus = collectStatus;
    }

    public String getCollectStatus() 
    {
        return collectStatus;
    }

    public void setMessageCount(Long messageCount) 
    {
        this.messageCount = messageCount;
    }

    public Long getMessageCount() 
    {
        return messageCount;
    }

    public void setErrorMessage(String errorMessage) 
    {
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage() 
    {
        return errorMessage;
    }

    public void setRetryCount(Long retryCount) 
    {
        this.retryCount = retryCount;
    }

    public Long getRetryCount() 
    {
        return retryCount;
    }

    public void setExecuteTime(Date executeTime) 
    {
        this.executeTime = executeTime;
    }

    public Date getExecuteTime() 
    {
        return executeTime;
    }

    public void setDuration(Long duration) 
    {
        this.duration = duration;
    }

    public Long getDuration() 
    {
        return duration;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("taskDate", getTaskDate())
            .append("collectStatus", getCollectStatus())
            .append("messageCount", getMessageCount())
            .append("errorMessage", getErrorMessage())
            .append("retryCount", getRetryCount())
            .append("executeTime", getExecuteTime())
            .append("duration", getDuration())
            .toString();
    }
}
