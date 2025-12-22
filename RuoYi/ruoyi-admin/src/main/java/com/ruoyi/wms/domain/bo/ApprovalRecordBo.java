package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.ApprovalRecord;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 审核记录业务对象
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ApprovalRecord.class)
public class ApprovalRecordBo extends BaseEntity {
    
    /**
     * 主键
     */
    private Long id;

    /**
     * 配置建议ID
     */
    private Long suggestionId;

    /**
     * 审核人ID
     */
    private Long approverId;

    /**
     * 审核人姓名
     */
    private String approverName;

    /**
     * 审核结果（1：通过，2：拒绝）
     */
    private Integer approvalResult;

    /**
     * 审核意见
     */
    private String approvalComment;

    /**
     * 审核时间
     */
    private LocalDateTime approvalTime;
}
