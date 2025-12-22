package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.time.LocalDateTime;

/**
 * 市场消息表
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("market_news")
public class MarketNews extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 关联的数字货币ID
     */
    private Long currencyId;

    /**
     * 消息标题
     */
    private String title;

    /**
     * 消息内容
     */
    private String content;

    /**
     * 消息来源
     */
    private String source;

    /**
     * 发布时间
     */
    private LocalDateTime publishTime;

    /**
     * 情感倾向（-1：利空，0：中性，1：利好）
     */
    private Integer sentiment;

    /**
     * 相关度（1-10）
     */
    private Integer relevance;
}
