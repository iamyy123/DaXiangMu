package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.CryptoReviewLog;
import com.ruoyi.system.service.ICryptoReviewLogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 审核记录Controller
 * 
 * @author ruoyi
 * @date 2025-12-15
 */
@RestController
@RequestMapping("/system/log")
public class CryptoReviewLogController extends BaseController
{
    @Autowired
    private ICryptoReviewLogService cryptoReviewLogService;

    /**
     * 查询审核记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:log:list')")
    @GetMapping("/list")
    public TableDataInfo list(CryptoReviewLog cryptoReviewLog)
    {
        startPage();
        List<CryptoReviewLog> list = cryptoReviewLogService.selectCryptoReviewLogList(cryptoReviewLog);
        return getDataTable(list);
    }

    /**
     * 导出审核记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:log:export')")
    @Log(title = "审核记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CryptoReviewLog cryptoReviewLog)
    {
        List<CryptoReviewLog> list = cryptoReviewLogService.selectCryptoReviewLogList(cryptoReviewLog);
        ExcelUtil<CryptoReviewLog> util = new ExcelUtil<CryptoReviewLog>(CryptoReviewLog.class);
        util.exportExcel(response, list, "审核记录数据");
    }

    /**
     * 获取审核记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:log:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cryptoReviewLogService.selectCryptoReviewLogById(id));
    }

    /**
     * 新增审核记录
     */
    @PreAuthorize("@ss.hasPermi('system:log:add')")
    @Log(title = "审核记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CryptoReviewLog cryptoReviewLog)
    {
        return toAjax(cryptoReviewLogService.insertCryptoReviewLog(cryptoReviewLog));
    }

    /**
     * 修改审核记录
     */
    @PreAuthorize("@ss.hasPermi('system:log:edit')")
    @Log(title = "审核记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CryptoReviewLog cryptoReviewLog)
    {
        return toAjax(cryptoReviewLogService.updateCryptoReviewLog(cryptoReviewLog));
    }

    /**
     * 删除审核记录
     */
    @PreAuthorize("@ss.hasPermi('system:log:remove')")
    @Log(title = "审核记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cryptoReviewLogService.deleteCryptoReviewLogByIds(ids));
    }
}
