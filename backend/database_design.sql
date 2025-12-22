-- 数字货币基本信息表
CREATE TABLE `crypto_currency` (
  `id` bigint NOT NULL COMMENT '主键',
  `symbol` varchar(20) NOT NULL COMMENT '货币代码（如BTC、ETH）',
  `name` varchar(50) NOT NULL COMMENT '货币名称',
  `description` text COMMENT '货币描述',
  `current_price` decimal(20,8) DEFAULT NULL COMMENT '当前价格（美元）',
  `market_cap` decimal(30,2) DEFAULT NULL COMMENT '市值',
  `circulating_supply` decimal(30,8) DEFAULT NULL COMMENT '流通供应量',
  `max_supply` decimal(30,8) DEFAULT NULL COMMENT '最大供应量',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_symbol` (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='数字货币基本信息表';

-- 市场消息表
CREATE TABLE `market_news` (
  `id` bigint NOT NULL COMMENT '主键',
  `currency_id` bigint DEFAULT NULL COMMENT '关联的数字货币ID',
  `title` varchar(200) NOT NULL COMMENT '消息标题',
  `content` text NOT NULL COMMENT '消息内容',
  `source` varchar(100) DEFAULT NULL COMMENT '消息来源',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `sentiment` tinyint NOT NULL COMMENT '情感倾向（-1：利空，0：中性，1：利好）',
  `relevance` tinyint DEFAULT '5' COMMENT '相关度（1-10）',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_currency_id` (`currency_id`),
  KEY `idx_publish_time` (`publish_time`),
  CONSTRAINT `fk_news_currency` FOREIGN KEY (`currency_id`) REFERENCES `crypto_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='市场消息表';

-- 持仓表
CREATE TABLE `portfolio` (
  `id` bigint NOT NULL COMMENT '主键',
  `currency_id` bigint NOT NULL COMMENT '数字货币ID',
  `quantity` decimal(20,8) NOT NULL COMMENT '持仓数量',
  `avg_price` decimal(20,8) NOT NULL COMMENT '平均买入价格',
  `current_value` decimal(20,2) NOT NULL COMMENT '当前市值',
  `allocation_percent` decimal(5,2) NOT NULL COMMENT '配置比例（%）',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_currency_id` (`currency_id`),
  CONSTRAINT `fk_portfolio_currency` FOREIGN KEY (`currency_id`) REFERENCES `crypto_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='持仓表';

-- 资产配置建议表
CREATE TABLE `allocation_suggestion` (
  `id` bigint NOT NULL COMMENT '主键',
  `suggestion_date` date NOT NULL COMMENT '建议日期',
  `total_value` decimal(20,2) NOT NULL COMMENT '总市值',
  `ai_analysis` text NOT NULL COMMENT 'AI分析结果',
  `status` tinyint NOT NULL COMMENT '状态（0：待审核，1：已通过，2：已拒绝）',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_suggestion_date` (`suggestion_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产配置建议表';

-- 配置建议详情表
CREATE TABLE `allocation_suggestion_detail` (
  `id` bigint NOT NULL COMMENT '主键',
  `suggestion_id` bigint NOT NULL COMMENT '配置建议ID',
  `currency_id` bigint NOT NULL COMMENT '数字货币ID',
  `target_quantity` decimal(20,8) NOT NULL COMMENT '目标数量',
  `target_allocation` decimal(5,2) NOT NULL COMMENT '目标配置比例（%）',
  `current_quantity` decimal(20,8) NOT NULL COMMENT '当前数量',
  `change_quantity` decimal(20,8) NOT NULL COMMENT '变动数量',
  `change_type` tinyint NOT NULL COMMENT '变动类型（1：买入，-1：卖出，0：不变）',
  PRIMARY KEY (`id`),
  KEY `idx_suggestion_id` (`suggestion_id`),
  KEY `idx_currency_id` (`currency_id`),
  CONSTRAINT `fk_suggestion_detail_suggestion` FOREIGN KEY (`suggestion_id`) REFERENCES `allocation_suggestion` (`id`),
  CONSTRAINT `fk_suggestion_detail_currency` FOREIGN KEY (`currency_id`) REFERENCES `crypto_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='配置建议详情表';

-- 审核记录表
CREATE TABLE `approval_record` (
  `id` bigint NOT NULL COMMENT '主键',
  `suggestion_id` bigint NOT NULL COMMENT '配置建议ID',
  `approver_id` bigint NOT NULL COMMENT '审核人ID',
  `approver_name` varchar(50) NOT NULL COMMENT '审核人姓名',
  `approval_result` tinyint NOT NULL COMMENT '审核结果（1：通过，2：拒绝）',
  `approval_comment` text COMMENT '审核意见',
  `approval_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_suggestion_id` (`suggestion_id`),
  CONSTRAINT `fk_approval_suggestion` FOREIGN KEY (`suggestion_id`) REFERENCES `allocation_suggestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='审核记录表';

-- 持仓变更记录表
CREATE TABLE `portfolio_change_log` (
  `id` bigint NOT NULL COMMENT '主键',
  `portfolio_id` bigint NOT NULL COMMENT '持仓ID',
  `currency_id` bigint NOT NULL COMMENT '数字货币ID',
  `before_quantity` decimal(20,8) NOT NULL COMMENT '变更前数量',
  `after_quantity` decimal(20,8) NOT NULL COMMENT '变更后数量',
  `before_avg_price` decimal(20,8) NOT NULL COMMENT '变更前平均价格',
  `after_avg_price` decimal(20,8) NOT NULL COMMENT '变更后平均价格',
  `change_reason` varchar(200) DEFAULT NULL COMMENT '变更原因',
  `change_time` datetime DEFAULT NULL COMMENT '变更时间',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人ID',
  `operator_name` varchar(50) DEFAULT NULL COMMENT '操作人姓名',
  PRIMARY KEY (`id`),
  KEY `idx_portfolio_id` (`portfolio_id`),
  KEY `idx_currency_id` (`currency_id`),
  KEY `idx_change_time` (`change_time`),
  CONSTRAINT `fk_change_log_portfolio` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`),
  CONSTRAINT `fk_change_log_currency` FOREIGN KEY (`currency_id`) REFERENCES `crypto_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='持仓变更记录表';