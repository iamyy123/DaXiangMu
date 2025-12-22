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
import com.ruoyi.wms.domain.bo.CryptoCurrencyBo;
import com.ruoyi.wms.domain.vo.CryptoCurrencyVo;
import com.ruoyi.wms.service.CryptoCurrencyService;

import java.util.List;
import java.util.Collection;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/crypto-currency")
public class CryptoCurrencyController extends BaseController {

    private final CryptoCurrencyService cryptoCurrencyService;

    /**
     * 查询数字货币列表
     */
    @GetMapping("/list")
    @SaCheckPermission("wms:crypto-currency:list")
    public TableDataInfo<CryptoCurrencyVo> list(CryptoCurrencyBo bo, PageQuery pageQuery) {
        return cryptoCurrencyService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询数字货币列表（无分页）
     */
    @GetMapping("/listNoPage")
    @SaCheckPermission("wms:crypto-currency:list")
    public R<List<CryptoCurrencyVo>> list(CryptoCurrencyBo bo) {
        return R.ok(cryptoCurrencyService.queryList(bo));
    }

    /**
     * 导出数字货币列表
     */
    @Log(title = "数字货币", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @SaCheckPermission("wms:crypto-currency:list")
    public void export(CryptoCurrencyBo bo, HttpServletResponse response) {
        List<CryptoCurrencyVo> list = cryptoCurrencyService.queryList(bo);
        ExcelUtil.exportExcel(list, "数字货币", CryptoCurrencyVo.class, response);
    }

    /**
     * 获取数字货币详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    @SaCheckPermission("wms:crypto-currency:list")
    public R<CryptoCurrencyVo> getInfo(@NotNull(message = "主键不能为空")
                                         @PathVariable Long id) {
        return R.ok(cryptoCurrencyService.queryById(id));
    }

    /**
     * 新增数字货币
     */
    @Log(title = "数字货币", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    @SaCheckPermission("wms:crypto-currency:edit")
    public R<Void> add(@Validated(AddGroup.class) @RequestBody CryptoCurrencyBo bo) {
        cryptoCurrencyService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改数字货币
     */
    @Log(title = "数字货币", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    @SaCheckPermission("wms:crypto-currency:edit")
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody CryptoCurrencyBo bo) {
        cryptoCurrencyService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除数字货币
     *
     * @param id 主键
     */
    @Log(title = "数字货币", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    @SaCheckPermission("wms:crypto-currency:edit")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                           @PathVariable Long id) {
        cryptoCurrencyService.deleteById(id);
        return R.ok();
    }

    /**
     * 批量删除数字货币
     */
    @Log(title = "数字货币", businessType = BusinessType.DELETE)
    @DeleteMapping("/batch")
    @SaCheckPermission("wms:crypto-currency:edit")
    public R<Void> removeBatch(@RequestBody Collection<Long> ids) {
        cryptoCurrencyService.deleteByIds(ids);
        return R.ok();
    }
}