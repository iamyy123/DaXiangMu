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
import com.ruoyi.wms.domain.bo.AllocationSuggestionBo;
import com.ruoyi.wms.domain.vo.AllocationSuggestionVo;
import com.ruoyi.wms.service.AllocationSuggestionService;

import java.util.List;
import java.util.Map;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/allocation-suggestion")
public class AllocationSuggestionController extends BaseController {

    private final AllocationSuggestionService allocationSuggestionService;

    /**
     * 查询资产配置建议列表
     */
    @GetMapping("/list")
    @SaCheckPermission("wms:allocation-suggestion:list")
    public TableDataInfo<AllocationSuggestionVo> list(AllocationSuggestionBo bo, PageQuery pageQuery) {
        return allocationSuggestionService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询资产配置建议列表（无分页）
     */
    @GetMapping("/listNoPage")
    @SaCheckPermission("wms:allocation-suggestion:list")
    public R<List<AllocationSuggestionVo>> list(AllocationSuggestionBo bo) {
        return R.ok(allocationSuggestionService.queryList(bo));
    }

    /**
     * 导出资产配置建议列表
     */
    @Log(title = "资产配置建议", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @SaCheckPermission("wms:allocation-suggestion:list")
    public void export(AllocationSuggestionBo bo, HttpServletResponse response) {
        List<AllocationSuggestionVo> list = allocationSuggestionService.queryList(bo);
        ExcelUtil.exportExcel(list, "资产配置建议", AllocationSuggestionVo.class, response);
    }

    /**
     * 获取资产配置建议详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    @SaCheckPermission("wms:allocation-suggestion:list")
    public R<AllocationSuggestionVo> getInfo(@NotNull(message = "主键不能为空")
                                         @PathVariable Long id) {
        return R.ok(allocationSuggestionService.queryById(id));
    }

    /**
     * 新增资产配置建议
     */
    @Log(title = "资产配置建议", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    @SaCheckPermission("wms:allocation-suggestion:edit")
    public R<Void> add(@Validated(AddGroup.class) @RequestBody AllocationSuggestionBo bo) {
        allocationSuggestionService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改资产配置建议
     */
    @Log(title = "资产配置建议", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    @SaCheckPermission("wms:allocation-suggestion:edit")
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody AllocationSuggestionBo bo) {
        allocationSuggestionService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除资产配置建议
     *
     * @param id 主键
     */
    @Log(title = "资产配置建议", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    @SaCheckPermission("wms:allocation-suggestion:edit")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                           @PathVariable Long id) {
        allocationSuggestionService.deleteById(id);
        return R.ok();
    }

    /**
     * 批量删除资产配置建议
     */
    @Log(title = "资产配置建议", businessType = BusinessType.DELETE)
    @DeleteMapping("/batch")
    @SaCheckPermission("wms:allocation-suggestion:edit")
    public R<Void> removeBatch(@RequestBody List<Long> ids) {
        allocationSuggestionService.deleteByIds(ids);
        return R.ok();
    }

    /**
     * 审核资产配置建议
     */
    @Log(title = "资产配置建议", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PostMapping("/approve")
    @SaCheckPermission("wms:allocation-suggestion:approve")
    public R<Void> approveSuggestion(@RequestBody Map<String, Object> params) {
        Long suggestionId = Long.valueOf(params.get("suggestionId").toString());
        Integer approvalResult = Integer.valueOf(params.get("approvalResult").toString());
        String approvalComment = params.get("approvalComment").toString();
        Long approverId = Long.valueOf(params.get("approverId").toString());
        String approverName = params.get("approverName").toString();

        allocationSuggestionService.approveSuggestion(suggestionId, approvalResult, approvalComment, approverId, approverName);
        return R.ok();
    }
}