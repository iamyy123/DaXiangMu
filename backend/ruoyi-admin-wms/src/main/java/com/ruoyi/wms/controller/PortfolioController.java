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
import com.ruoyi.wms.domain.bo.PortfolioBo;
import com.ruoyi.wms.domain.vo.PortfolioVo;
import com.ruoyi.wms.service.PortfolioService;

import java.util.List;
import java.util.Collection;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/portfolio")
public class PortfolioController extends BaseController {

    private final PortfolioService portfolioService;

    /**
     * 查询持仓列表
     */
    @GetMapping("/list")
    @SaCheckPermission("wms:portfolio:list")
    public TableDataInfo<PortfolioVo> list(PortfolioBo bo, PageQuery pageQuery) {
        return portfolioService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询持仓列表（无分页）
     */
    @GetMapping("/listNoPage")
    @SaCheckPermission("wms:portfolio:list")
    public R<List<PortfolioVo>> list(PortfolioBo bo) {
        return R.ok(portfolioService.queryList(bo));
    }

    /**
     * 导出持仓列表
     */
    @Log(title = "持仓", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @SaCheckPermission("wms:portfolio:list")
    public void export(PortfolioBo bo, HttpServletResponse response) {
        List<PortfolioVo> list = portfolioService.queryList(bo);
        ExcelUtil.exportExcel(list, "持仓", PortfolioVo.class, response);
    }

    /**
     * 获取持仓详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    @SaCheckPermission("wms:portfolio:list")
    public R<PortfolioVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(portfolioService.queryById(id));
    }

    /**
     * 新增持仓
     */
    @Log(title = "持仓", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    @SaCheckPermission("wms:portfolio:edit")
    public R<Void> add(@Validated(AddGroup.class) @RequestBody PortfolioBo bo) {
        portfolioService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改持仓
     */
    @Log(title = "持仓", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    @SaCheckPermission("wms:portfolio:edit")
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody PortfolioBo bo) {
        portfolioService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除持仓
     *
     * @param id 主键
     */
    @Log(title = "持仓", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    @SaCheckPermission("wms:portfolio:edit")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                           @PathVariable Long id) {
        portfolioService.deleteById(id);
        return R.ok();
    }

    /**
     * 批量删除持仓
     */
    @Log(title = "持仓", businessType = BusinessType.DELETE)
    @DeleteMapping("/batch")
    @SaCheckPermission("wms:portfolio:edit")
    public R<Void> removeBatch(@RequestBody Collection<Long> ids) {
        portfolioService.deleteByIds(ids);
        return R.ok();
    }
}