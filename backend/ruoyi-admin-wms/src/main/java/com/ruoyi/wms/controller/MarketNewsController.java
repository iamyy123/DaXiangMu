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
import com.ruoyi.wms.domain.bo.MarketNewsBo;
import com.ruoyi.wms.domain.vo.MarketNewsVo;
import com.ruoyi.wms.service.MarketNewsService;

import java.util.List;
import java.util.Collection;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/market-news")
public class MarketNewsController extends BaseController {

    private final MarketNewsService marketNewsService;

    /**
     * 查询市场新闻列表
     */
    @GetMapping("/list")
    @SaCheckPermission("wms:market-news:list")
    public TableDataInfo<MarketNewsVo> list(MarketNewsBo bo, PageQuery pageQuery) {
        return marketNewsService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询市场新闻列表（无分页）
     */
    @GetMapping("/listNoPage")
    @SaCheckPermission("wms:market-news:list")
    public R<List<MarketNewsVo>> list(MarketNewsBo bo) {
        return R.ok(marketNewsService.queryList(bo));
    }

    /**
     * 导出市场新闻列表
     */
    @Log(title = "市场新闻", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @SaCheckPermission("wms:market-news:list")
    public void export(MarketNewsBo bo, HttpServletResponse response) {
        List<MarketNewsVo> list = marketNewsService.queryList(bo);
        ExcelUtil.exportExcel(list, "市场新闻", MarketNewsVo.class, response);
    }

    /**
     * 获取市场新闻详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    @SaCheckPermission("wms:market-news:list")
    public R<MarketNewsVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(marketNewsService.queryById(id));
    }

    /**
     * 新增市场新闻
     */
    @Log(title = "市场新闻", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    @SaCheckPermission("wms:market-news:edit")
    public R<Void> add(@Validated(AddGroup.class) @RequestBody MarketNewsBo bo) {
        marketNewsService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改市场新闻
     */
    @Log(title = "市场新闻", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    @SaCheckPermission("wms:market-news:edit")
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody MarketNewsBo bo) {
        marketNewsService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除市场新闻
     *
     * @param id 主键
     */
    @Log(title = "市场新闻", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    @SaCheckPermission("wms:market-news:edit")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                           @PathVariable Long id) {
        marketNewsService.deleteById(id);
        return R.ok();
    }

    /**
     * 批量删除市场新闻
     */
    @Log(title = "市场新闻", businessType = BusinessType.DELETE)
    @DeleteMapping("/batch")
    @SaCheckPermission("wms:market-news:edit")
    public R<Void> removeBatch(@RequestBody Collection<Long> ids) {
        marketNewsService.deleteByIds(ids);
        return R.ok();
    }
}