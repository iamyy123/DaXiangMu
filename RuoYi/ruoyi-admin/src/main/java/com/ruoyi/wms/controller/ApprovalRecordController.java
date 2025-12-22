package com.ruoyi.wms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.excel.utils.ExcelUtil;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.web.core.BaseController;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.wms.domain.bo.ApprovalRecordBo;
import com.ruoyi.wms.domain.vo.ApprovalRecordVo;
import com.ruoyi.wms.service.ApprovalRecordService;

import java.util.List;
import java.util.Collection;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/approval-record")
public class ApprovalRecordController extends BaseController {

    private final ApprovalRecordService approvalRecordService;

    /**
     * 查询审核记录列表
     */
    @GetMapping("/list")
    @SaCheckPermission("wms:approval-record:list")
    public TableDataInfo<ApprovalRecordVo> list(ApprovalRecordBo bo, PageQuery pageQuery) {
        return approvalRecordService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询审核记录列表（无分页）
     */
    @GetMapping("/listNoPage")
    @SaCheckPermission("wms:approval-record:list")
    public R<List<ApprovalRecordVo>> list(ApprovalRecordBo bo) {
        return R.ok(approvalRecordService.queryList(bo));
    }

    /**
     * 导出审核记录列表
     */
    @Log(title = "审核记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @SaCheckPermission("wms:approval-record:list")
    public void export(ApprovalRecordBo bo, HttpServletResponse response) {
        List<ApprovalRecordVo> list = approvalRecordService.queryList(bo);
        ExcelUtil.exportExcel(list, "审核记录", ApprovalRecordVo.class, response);
    }

    /**
     * 获取审核记录详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    @SaCheckPermission("wms:approval-record:list")
    public R<ApprovalRecordVo> getInfo(@NotNull(message = "主键不能为空")
                                         @PathVariable Long id) {
        return R.ok(approvalRecordService.queryById(id));
    }

    /**
     * 新增审核记录
     */
    @Log(title = "审核记录", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    @SaCheckPermission("wms:approval-record:edit")
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ApprovalRecordBo bo) {
        approvalRecordService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改审核记录
     */
    @Log(title = "审核记录", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    @SaCheckPermission("wms:approval-record:edit")
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ApprovalRecordBo bo) {
        approvalRecordService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除审核记录
     *
     * @param id 主键
     */
    @Log(title = "审核记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    @SaCheckPermission("wms:approval-record:edit")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                           @PathVariable Long id) {
        approvalRecordService.deleteById(id);
        return R.ok();
    }

    /**
     * 批量删除审核记录
     */
    @Log(title = "审核记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/batch")
    @SaCheckPermission("wms:approval-record:edit")
    public R<Void> removeBatch(@RequestBody Collection<Long> ids) {
        approvalRecordService.deleteByIds(ids);
        return R.ok();
    }
}