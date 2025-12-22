package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.ApprovalRecord;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 审核记录VO
 *
 * @author student
 */

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ApprovalRecord.class)
public class ApprovalRecordVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 配置建议ID
     */
    @ExcelProperty(value = "配置建议ID")
    private Long suggestionId;

    /**
     * 配置建议日期
     */
    @ExcelProperty(value = "配置建议日期")
    private String suggestionDate;

    /**
     * 审核人ID
     */
    @ExcelProperty(value = "审核人ID")
    private Long approverId;

    /**
     * 审核人姓名
     */
    @ExcelProperty(value = "审核人姓名")
    private String approverName;

    /**
     * 审核结果（1：通过，2：拒绝）
     */
    @ExcelProperty(value = "审核结果")
    private Integer approvalResult;

    /**
     * 审核结果描述
     */
    @ExcelProperty(value = "审核结果描述")
    private String approvalResultDesc;

    /**
     * 审核意见
     */
    @ExcelProperty(value = "审核意见")
    private String approvalComment;

    /**
     * 审核时间
     */
    @ExcelProperty(value = "审核时间")
    private LocalDateTime approvalTime;
}
