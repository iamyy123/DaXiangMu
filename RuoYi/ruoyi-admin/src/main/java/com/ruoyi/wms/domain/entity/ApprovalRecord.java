package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.time.LocalDateTime;

/**
 * 审核记录表
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("approval_record")
public class ApprovalRecord extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id")
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
