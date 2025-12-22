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
import com.ruoyi.system.domain.CryptoPosition;
import com.ruoyi.system.service.ICryptoPositionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 持仓数据Controller
 * 
 * @author lhy
 * @date 2025-12-16
 */
@RestController
@RequestMapping("/system/position")
public class CryptoPositionController extends BaseController
{
    @Autowired
    private ICryptoPositionService cryptoPositionService;

    /**
     * 查询持仓数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:position:list')")
    @GetMapping("/list")
    public TableDataInfo list(CryptoPosition cryptoPosition)
    {
        startPage();
        List<CryptoPosition> list = cryptoPositionService.selectCryptoPositionList(cryptoPosition);
        return getDataTable(list);
    }

    /**
     * 导出持仓数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:position:export')")
    @Log(title = "持仓数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CryptoPosition cryptoPosition)
    {
        List<CryptoPosition> list = cryptoPositionService.selectCryptoPositionList(cryptoPosition);
        ExcelUtil<CryptoPosition> util = new ExcelUtil<CryptoPosition>(CryptoPosition.class);
        util.exportExcel(response, list, "持仓数据数据");
    }

    /**
     * 获取持仓数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:position:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cryptoPositionService.selectCryptoPositionById(id));
    }

    /**
     * 新增持仓数据
     */
    @PreAuthorize("@ss.hasPermi('system:position:add')")
    @Log(title = "持仓数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CryptoPosition cryptoPosition)
    {
        return toAjax(cryptoPositionService.insertCryptoPosition(cryptoPosition));
    }

    /**
     * 修改持仓数据
     */
    @PreAuthorize("@ss.hasPermi('system:position:edit')")
    @Log(title = "持仓数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CryptoPosition cryptoPosition)
    {
        return toAjax(cryptoPositionService.updateCryptoPosition(cryptoPosition));
    }

    /**
     * 删除持仓数据
     */
    @PreAuthorize("@ss.hasPermi('system:position:remove')")
    @Log(title = "持仓数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cryptoPositionService.deleteCryptoPositionByIds(ids));
    }
}
