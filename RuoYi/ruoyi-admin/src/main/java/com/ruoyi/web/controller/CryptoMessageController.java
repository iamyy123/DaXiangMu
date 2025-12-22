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
import com.ruoyi.system.domain.CryptoMessage;
import com.ruoyi.system.service.ICryptoMessageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 数字货币消息Controller
 * 
 * @author lhy
 * @date 2025-12-15
 */
@RestController
@RequestMapping("/system/message")
public class CryptoMessageController extends BaseController
{
    @Autowired
    private ICryptoMessageService cryptoMessageService;

    /**
     * 查询数字货币消息列表
     */
    @PreAuthorize("@ss.hasPermi('system:message:list')")
    @GetMapping("/list")
    public TableDataInfo list(CryptoMessage cryptoMessage)
    {
        startPage();
        List<CryptoMessage> list = cryptoMessageService.selectCryptoMessageList(cryptoMessage);
        return getDataTable(list);
    }

    /**
     * 导出数字货币消息列表
     */
    @PreAuthorize("@ss.hasPermi('system:message:export')")
    @Log(title = "数字货币消息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CryptoMessage cryptoMessage)
    {
        List<CryptoMessage> list = cryptoMessageService.selectCryptoMessageList(cryptoMessage);
        ExcelUtil<CryptoMessage> util = new ExcelUtil<CryptoMessage>(CryptoMessage.class);
        util.exportExcel(response, list, "数字货币消息数据");
    }

    /**
     * 获取数字货币消息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:message:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cryptoMessageService.selectCryptoMessageById(id));
    }

    /**
     * 新增数字货币消息
     */
    @PreAuthorize("@ss.hasPermi('system:message:add')")
    @Log(title = "数字货币消息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CryptoMessage cryptoMessage)
    {
        return toAjax(cryptoMessageService.insertCryptoMessage(cryptoMessage));
    }

    /**
     * 修改数字货币消息
     */
    @PreAuthorize("@ss.hasPermi('system:message:edit')")
    @Log(title = "数字货币消息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CryptoMessage cryptoMessage)
    {
        return toAjax(cryptoMessageService.updateCryptoMessage(cryptoMessage));
    }

    /**
     * 删除数字货币消息
     */
    @PreAuthorize("@ss.hasPermi('system:message:remove')")
    @Log(title = "数字货币消息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cryptoMessageService.deleteCryptoMessageByIds(ids));
    }
}
