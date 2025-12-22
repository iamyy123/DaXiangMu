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
import com.ruoyi.system.domain.CryptoAiReport;
import com.ruoyi.system.service.ICryptoAiReportService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * AI分析报告Controller
 * 
 * @author lhy
 * @date 2025-12-16
 */
@RestController
@RequestMapping("/system/report")
public class CryptoAiReportController extends BaseController
{
    @Autowired
    private ICryptoAiReportService cryptoAiReportService;

    /**
     * 查询AI分析报告列表
     */
    @PreAuthorize("@ss.hasPermi('system:report:list')")
    @GetMapping("/list")
    public TableDataInfo list(CryptoAiReport cryptoAiReport)
    {
        startPage();
        List<CryptoAiReport> list = cryptoAiReportService.selectCryptoAiReportList(cryptoAiReport);
        return getDataTable(list);
    }

    /**
     * 导出AI分析报告列表
     */
    @PreAuthorize("@ss.hasPermi('system:report:export')")
    @Log(title = "AI分析报告", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CryptoAiReport cryptoAiReport)
    {
        List<CryptoAiReport> list = cryptoAiReportService.selectCryptoAiReportList(cryptoAiReport);
        ExcelUtil<CryptoAiReport> util = new ExcelUtil<CryptoAiReport>(CryptoAiReport.class);
        util.exportExcel(response, list, "AI分析报告数据");
    }

    /**
     * 获取AI分析报告详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:report:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cryptoAiReportService.selectCryptoAiReportById(id));
    }

    /**
     * 新增AI分析报告
     */
    @PreAuthorize("@ss.hasPermi('system:report:add')")
    @Log(title = "AI分析报告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CryptoAiReport cryptoAiReport)
    {
        return toAjax(cryptoAiReportService.insertCryptoAiReport(cryptoAiReport));
    }

    /**
     * 修改AI分析报告
     */
    @PreAuthorize("@ss.hasPermi('system:report:edit')")
    @Log(title = "AI分析报告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CryptoAiReport cryptoAiReport)
    {
        return toAjax(cryptoAiReportService.updateCryptoAiReport(cryptoAiReport));
    }

    /**
     * 删除AI分析报告
     */
    @PreAuthorize("@ss.hasPermi('system:report:remove')")
    @Log(title = "AI分析报告", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cryptoAiReportService.deleteCryptoAiReportByIds(ids));
    }
}
