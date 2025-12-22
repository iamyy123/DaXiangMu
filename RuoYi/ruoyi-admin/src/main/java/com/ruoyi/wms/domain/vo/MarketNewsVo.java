package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.MarketNews;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 市场消息VO
 *
 * @author student
 */

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = MarketNews.class)
public class MarketNewsVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 关联的数字货币ID
     */
    @ExcelProperty(value = "数字货币ID")
    private Long currencyId;

    /**
     * 数字货币名称
     */
    @ExcelProperty(value = "数字货币名称")
    private String currencyName;

    /**
     * 消息标题
     */
    @ExcelProperty(value = "消息标题")
    private String title;

    /**
     * 消息内容
     */
    @ExcelProperty(value = "消息内容")
    private String content;

    /**
     * 消息来源
     */
    @ExcelProperty(value = "消息来源")
    private String source;

    /**
     * 发布时间
     */
    @ExcelProperty(value = "发布时间")
    private LocalDateTime publishTime;

    /**
     * 情感倾向（-1：利空，0：中性，1：利好）
     */
    @ExcelProperty(value = "情感倾向")
    private Integer sentiment;

    /**
     * 情感倾向描述
     */
    @ExcelProperty(value = "情感倾向描述")
    private String sentimentDesc;

    /**
     * 相关度（1-10）
     */
    @ExcelProperty(value = "相关度")
    private Integer relevance;
}
