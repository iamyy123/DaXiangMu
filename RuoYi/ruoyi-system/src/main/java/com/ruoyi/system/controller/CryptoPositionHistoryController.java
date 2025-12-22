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
import com.ruoyi.system.domain.CryptoPositionHistory;
import com.ruoyi.system.service.ICryptoPositionHistoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 持仓历史记录Controller
 * 
 * @author lhy
 * @date 2025-12-16
 */
@RestController
@RequestMapping("/system/history")
public class CryptoPositionHistoryController extends BaseController
{
    @Autowired
    private ICryptoPositionHistoryService cryptoPositionHistoryService;

    /**
     * 查询持仓历史记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:history:list')")
    @GetMapping("/list")
    public TableDataInfo list(CryptoPositionHistory cryptoPositionHistory)
    {
        startPage();
        List<CryptoPositionHistory> list = cryptoPositionHistoryService.selectCryptoPositionHistoryList(cryptoPositionHistory);
        return getDataTable(list);
    }

    /**
     * 导出持仓历史记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:history:export')")
    @Log(title = "持仓历史记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CryptoPositionHistory cryptoPositionHistory)
    {
        List<CryptoPositionHistory> list = cryptoPositionHistoryService.selectCryptoPositionHistoryList(cryptoPositionHistory);
        ExcelUtil<CryptoPositionHistory> util = new ExcelUtil<CryptoPositionHistory>(CryptoPositionHistory.class);
        util.exportExcel(response, list, "持仓历史记录数据");
    }

    /**
     * 获取持仓历史记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:history:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cryptoPositionHistoryService.selectCryptoPositionHistoryById(id));
    }

    /**
     * 新增持仓历史记录
     */
    @PreAuthorize("@ss.hasPermi('system:history:add')")
    @Log(title = "持仓历史记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CryptoPositionHistory cryptoPositionHistory)
    {
        return toAjax(cryptoPositionHistoryService.insertCryptoPositionHistory(cryptoPositionHistory));
    }

    /**
     * 修改持仓历史记录
     */
    @PreAuthorize("@ss.hasPermi('system:history:edit')")
    @Log(title = "持仓历史记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CryptoPositionHistory cryptoPositionHistory)
    {
        return toAjax(cryptoPositionHistoryService.updateCryptoPositionHistory(cryptoPositionHistory));
    }

    /**
     * 删除持仓历史记录
     */
    @PreAuthorize("@ss.hasPermi('system:history:remove')")
    @Log(title = "持仓历史记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cryptoPositionHistoryService.deleteCryptoPositionHistoryByIds(ids));
    }
}
