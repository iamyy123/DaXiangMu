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
import com.ruoyi.system.domain.CryptoDifyConfig;
import com.ruoyi.system.service.ICryptoDifyConfigService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * Dify智能体配置Controller
 * 
 * @author lhy
 * @date 2025-12-15
 */
@RestController
@RequestMapping("/system/difyconfig")
public class CryptoDifyConfigController extends BaseController
{
    @Autowired
    private ICryptoDifyConfigService cryptoDifyConfigService;

    /**
     * 查询Dify智能体配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:difyconfig:list')")
    @GetMapping("/list")
    public TableDataInfo list(CryptoDifyConfig cryptoDifyConfig)
    {
        startPage();
        List<CryptoDifyConfig> list = cryptoDifyConfigService.selectCryptoDifyConfigList(cryptoDifyConfig);
        return getDataTable(list);
    }

    /**
     * 导出Dify智能体配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:difyconfig:export')")
    @Log(title = "Dify智能体配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CryptoDifyConfig cryptoDifyConfig)
    {
        List<CryptoDifyConfig> list = cryptoDifyConfigService.selectCryptoDifyConfigList(cryptoDifyConfig);
        ExcelUtil<CryptoDifyConfig> util = new ExcelUtil<CryptoDifyConfig>(CryptoDifyConfig.class);
        util.exportExcel(response, list, "Dify智能体配置数据");
    }

    /**
     * 获取Dify智能体配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:difyconfig:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cryptoDifyConfigService.selectCryptoDifyConfigById(id));
    }

    /**
     * 新增Dify智能体配置
     */
    @PreAuthorize("@ss.hasPermi('system:difyconfig:add')")
    @Log(title = "Dify智能体配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CryptoDifyConfig cryptoDifyConfig)
    {
        return toAjax(cryptoDifyConfigService.insertCryptoDifyConfig(cryptoDifyConfig));
    }

    /**
     * 修改Dify智能体配置
     */
    @PreAuthorize("@ss.hasPermi('system:difyconfig:edit')")
    @Log(title = "Dify智能体配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CryptoDifyConfig cryptoDifyConfig)
    {
        return toAjax(cryptoDifyConfigService.updateCryptoDifyConfig(cryptoDifyConfig));
    }

    /**
     * 删除Dify智能体配置
     */
    @PreAuthorize("@ss.hasPermi('system:difyconfig:remove')")
    @Log(title = "Dify智能体配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cryptoDifyConfigService.deleteCryptoDifyConfigByIds(ids));
    }
}
