package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.MarketNews;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 市场消息业务对象
 *
 * @author student
 */

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = MarketNews.class)
public class MarketNewsBo extends BaseEntity {
    
    /**
     * 主键
     */
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
