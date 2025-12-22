-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: investment
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crypto_ai_report`
--

DROP TABLE IF EXISTS `crypto_ai_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_ai_report` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '报告ID（主键）',
  `message_id` bigint DEFAULT NULL COMMENT '关联消息ID',
  `report_date` date DEFAULT NULL COMMENT '报告日期',
  `first_analysis` varchar(255) DEFAULT NULL COMMENT '第一次分析结果（消息情感分析）',
  `position_snapshot` text COMMENT '持仓快照（JSON格式）',
  `second_analysis` varchar(255) DEFAULT NULL COMMENT '第二次分析结果（持仓匹配分析）',
  `adjustment_suggestion` text COMMENT '调整建议（JSON格式）',
  `analysis_basis` varchar(500) DEFAULT NULL COMMENT '分析依据',
  `report_status` varchar(20) DEFAULT NULL COMMENT '报告状态（PENDING=待审核/APPROVED=已通过/REJECTED=已驳回）',
  `reviewer_id` bigint DEFAULT NULL COMMENT '审核人ID（关联sys_user表id）',
  `review_time` date DEFAULT NULL COMMENT '审核时间',
  `reject_reason` varchar(500) DEFAULT NULL COMMENT '驳回原因',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（继承BaseEntity）',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（继承BaseEntity）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_message_id` (`message_id`) USING BTREE,
  KEY `idx_report_status` (`report_status`) USING BTREE,
  KEY `idx_reviewer_id` (`reviewer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AI分析报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_ai_report`
--

LOCK TABLES `crypto_ai_report` WRITE;
/*!40000 ALTER TABLE `crypto_ai_report` DISABLE KEYS */;
INSERT INTO `crypto_ai_report` VALUES (1,1,'2025-12-16','该消息对BTC构成重大利好。ETF资金流入创新高表明机构投资者信心增强，可能推动BTC价格上涨。影响等级：5/5，建议关注后续资金流向。','[{\"coinType\":\"BTC\",\"amount\":61.53846154,\"percentage\":40.00,\"usdValue\":4000000.00,\"price\":65000.00},{\"coinType\":\"ETH\",\"amount\":1000.00000000,\"percentage\":35.00,\"usdValue\":3500000.00,\"price\":3500.00},{\"coinType\":\"SOL\",\"amount\":10000.00000000,\"percentage\":15.00,\"usdValue\":1500000.00,\"price\":150.00},{\"coinType\":\"USDT\",\"amount\":1000000.00000000,\"percentage\":10.00,\"usdValue\":1000000.00,\"price\":1.00}]','结合当前持仓结构和消息影响，分析如下：\n1. 当前BTC持仓占比40%，处于合理区间。\n2. 鉴于ETF资金流入创新高的重大利好，建议适度增持BTC至45%。\n3. 可适当减少ETH持仓至30%，SOL和USDT保持现有比例。','{\"positions\":[{\"coinType\":\"BTC\",\"percentage\":45.00},{\"coinType\":\"ETH\",\"percentage\":30.00},{\"coinType\":\"SOL\",\"percentage\":15.00},{\"coinType\":\"USDT\",\"percentage\":10.00}]}','1. BTC ETF资金流入创新高是重大利好信号\n2. 当前BTC持仓占比合理，但可适度增持以把握机会\n3. 建议在保持总资产不变的前提下，调整BTC和ETH的占比','PENDING',NULL,NULL,NULL,'2025-12-16 07:41:18','2025-12-16 07:41:18'),(2,2,'2025-12-15','该消息对ETH构成利好。质押量增长表明网络安全性提升，同时减少了市场流通量，可能对价格产生正面影响。影响等级：4/5。','[{\"coinType\":\"BTC\",\"amount\":61.53846154,\"percentage\":40.00,\"usdValue\":4000000.00,\"price\":65000.00},{\"coinType\":\"ETH\",\"amount\":1000.00000000,\"percentage\":35.00,\"usdValue\":3500000.00,\"price\":3500.00},{\"coinType\":\"SOL\",\"amount\":10000.00000000,\"percentage\":15.00,\"usdValue\":1500000.00,\"price\":150.00},{\"coinType\":\"USDT\",\"amount\":1000000.00000000,\"percentage\":10.00,\"usdValue\":1000000.00,\"price\":1.00}]','结合当前持仓结构和消息影响，分析如下：\n1. 当前ETH持仓占比35%，处于合理区间。\n2. 质押量增长是长期利好，建议保持ETH持仓比例不变。\n3. 整体持仓结构合理，无需大幅调整。','{\"positions\":[{\"coinType\":\"BTC\",\"percentage\":40.00},{\"coinType\":\"ETH\",\"percentage\":35.00},{\"coinType\":\"SOL\",\"percentage\":15.00},{\"coinType\":\"USDT\",\"percentage\":10.00}]}','1. ETH质押量增长是长期利好因素\n2. 当前持仓结构已经较为合理\n3. 建议保持现有配置，关注后续发展','APPROVED',NULL,NULL,NULL,'2025-12-16 07:41:18','2025-12-16 07:41:18'),(3,3,'2025-12-14','该消息对SOL构成利好。TVL增长表明生态活跃度提升，可能吸引更多开发者和用户，推动SOL价格上涨。影响等级：4/5。','[{\"coinType\":\"BTC\",\"amount\":61.53846154,\"percentage\":40.00,\"usdValue\":4000000.00,\"price\":65000.00},{\"coinType\":\"ETH\",\"amount\":1000.00000000,\"percentage\":35.00,\"usdValue\":3500000.00,\"price\":3500.00},{\"coinType\":\"SOL\",\"amount\":10000.00000000,\"percentage\":15.00,\"usdValue\":1500000.00,\"price\":150.00},{\"coinType\":\"USDT\",\"amount\":1000000.00000000,\"percentage\":10.00,\"usdValue\":1000000.00,\"price\":1.00}]','结合当前持仓结构和消息影响，分析如下：\n1. 当前SOL持仓占比15%，相对较低。\n2. 鉴于SOL生态TVL增长的重大利好，建议适度增持SOL至20%。\n3. 可适当减少BTC持仓至35%，ETH和USDT保持现有比例。','{\"positions\":[{\"coinType\":\"BTC\",\"percentage\":35.00},{\"coinType\":\"ETH\",\"percentage\":35.00},{\"coinType\":\"SOL\",\"percentage\":20.00},{\"coinType\":\"USDT\",\"percentage\":10.00}]}','1. SOL生态TVL增长是重大利好\n2. 当前SOL持仓占比偏低，建议适度增持\n3. 在保持总资产不变的前提下调整配置','PENDING',NULL,NULL,NULL,'2025-12-16 07:41:18','2025-12-16 07:41:18'),(4,4,'2025-12-13','该消息对BTC构成利好。突破关键阻力位是技术面看涨信号，可能吸引更多技术交易者入场。影响等级：4/5。','[{\"coinType\":\"BTC\",\"amount\":61.53846154,\"percentage\":40.00,\"usdValue\":4000000.00,\"price\":65000.00},{\"coinType\":\"ETH\",\"amount\":1000.00000000,\"percentage\":35.00,\"usdValue\":3500000.00,\"price\":3500.00},{\"coinType\":\"SOL\",\"amount\":10000.00000000,\"percentage\":15.00,\"usdValue\":1500000.00,\"price\":150.00},{\"coinType\":\"USDT\",\"amount\":1000000.00000000,\"percentage\":10.00,\"usdValue\":1000000.00,\"price\":1.00}]','结合当前持仓结构和消息影响，分析如下：\n1. 当前BTC持仓占比40%，处于合理区间。\n2. 技术面突破是短期利好，建议保持BTC持仓比例不变。\n3. 整体持仓结构合理，无需调整。','{\"positions\":[{\"coinType\":\"BTC\",\"percentage\":40.00},{\"coinType\":\"ETH\",\"percentage\":35.00},{\"coinType\":\"SOL\",\"percentage\":15.00},{\"coinType\":\"USDT\",\"percentage\":10.00}]}','1. 技术面突破是短期利好信号\n2. 当前持仓结构已经合理\n3. 建议保持现有配置','REJECTED',NULL,NULL,NULL,'2025-12-16 07:41:18','2025-12-16 07:41:18'),(5,5,'2025-12-12','该消息对SOL构成利好。生态扶持计划有利于Solana生态发展，可能吸引更多项目入驻，推动SOL价格上涨。影响等级：4/5。','[{\"coinType\":\"BTC\",\"amount\":61.53846154,\"percentage\":40.00,\"usdValue\":4000000.00,\"price\":65000.00},{\"coinType\":\"ETH\",\"amount\":1000.00000000,\"percentage\":35.00,\"usdValue\":3500000.00,\"price\":3500.00},{\"coinType\":\"SOL\",\"amount\":10000.00000000,\"percentage\":15.00,\"usdValue\":1500000.00,\"price\":150.00},{\"coinType\":\"USDT\",\"amount\":1000000.00000000,\"percentage\":10.00,\"usdValue\":1000000.00,\"price\":1.00}]','结合当前持仓结构和消息影响，分析如下：\n1. 当前SOL持仓占比15%，相对较低。\n2. 鉴于生态扶持计划的重大利好，建议适度增持SOL至18%。\n3. 可适当减少ETH持仓至32%，BTC和USDT保持现有比例。','{\"positions\":[{\"coinType\":\"BTC\",\"percentage\":40.00},{\"coinType\":\"ETH\",\"percentage\":32.00},{\"coinType\":\"SOL\",\"percentage\":18.00},{\"coinType\":\"USDT\",\"percentage\":10.00}]}','1. 生态扶持计划有利于SOL长期发展\n2. 当前SOL持仓占比偏低，建议适度增持\n3. 在保持总资产不变的前提下调整配置','PENDING',NULL,NULL,NULL,'2025-12-16 07:41:18','2025-12-16 07:41:18'),(6,NULL,'2025-12-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-16 16:19:11','2025-12-16 16:19:11');
/*!40000 ALTER TABLE `crypto_ai_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto_collect_log`
--

DROP TABLE IF EXISTS `crypto_collect_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_collect_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` bigint DEFAULT NULL COMMENT '采集任务ID（关联采集任务表主键）',
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '采集任务名称',
  `collect_time` datetime DEFAULT NULL COMMENT '采集时间',
  `collect_status` tinyint DEFAULT NULL COMMENT '采集状态（0-失败 1-成功 2-执行中）',
  `collect_count` int DEFAULT '0' COMMENT '采集数据条数',
  `collect_source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '采集来源（如：API、MQ、数据库等）',
  `error_msg` text COLLATE utf8mb4_unicode_ci COMMENT '错误信息（采集失败时存储）',
  `cost_time` int DEFAULT '0' COMMENT '采集耗时（单位：毫秒）',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人（操作人）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_task_id` (`task_id`) USING BTREE COMMENT '任务ID索引',
  KEY `idx_collect_time` (`collect_time`) USING BTREE COMMENT '采集时间索引',
  KEY `idx_collect_status` (`collect_status`) USING BTREE COMMENT '采集状态索引'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息采集任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_collect_log`
--

LOCK TABLES `crypto_collect_log` WRITE;
/*!40000 ALTER TABLE `crypto_collect_log` DISABLE KEYS */;
INSERT INTO `crypto_collect_log` VALUES (1,1001,'加密货币行情采集-币安API','2025-12-19 08:30:22',1,2048,'API',NULL,1250,'admin','2025-12-19 08:30:22','2025-12-19 08:30:22','每日定时采集币安现货行情数据'),(2,1002,'用户持仓记录同步','2025-12-19 09:15:47',1,36,'数据库',NULL,320,'zhangshan','2025-12-19 09:15:47','2025-12-19 09:15:47','同步MySQL用户持仓表数据'),(3,1001,'加密货币行情采集-币安API','2025-12-19 09:30:15',0,0,'API','java.net.SocketTimeoutException: 连接超时（超时时间：5000ms），请检查网络或API服务可用性',5000,'admin','2025-12-19 09:30:15','2025-12-19 09:30:15','第二次定时任务，API服务不稳定导致超时'),(4,1003,'交易订单实时推送','2025-12-19 10:05:33',2,0,'MQ',NULL,0,'lisi','2025-12-19 10:05:33','2025-12-19 10:05:33','监听RabbitMQ交易订单队列，正在采集'),(5,1004,'NFT市场数据采集-OpenSea','2025-12-19 11:20:18',1,512,'API',NULL,890,'wangwu','2025-12-19 11:20:18','2025-12-19 11:20:18','采集OpenSea热门NFT地板价数据'),(6,1004,'NFT市场数据采集-OpenSea','2025-12-19 12:20:03',0,0,'API','401 Unauthorized：API密钥过期，请重新申请密钥',350,'wangwu','2025-12-19 12:20:03','2025-12-19 12:20:03','密钥有效期7天，已过期未更新'),(7,1005,'历史交易记录归档','2025-12-19 14:08:55',1,1896,'数据库',NULL,2100,'admin','2025-12-19 14:08:55','2025-12-19 14:08:55','归档2025年11月历史交易数据'),(8,1006,'加密货币K线数据批量下载','2025-12-19 15:30:41',2,0,'API',NULL,0,'zhaoliu','2025-12-19 15:30:41','2025-12-19 15:30:41','下载近30天BTC 1小时K线数据，预计耗时10分钟'),(9,1003,'交易订单实时推送','2025-12-19 16:45:29',1,156,'MQ',NULL,480,'lisi','2025-12-19 16:45:29','2025-12-19 16:45:29','10:05的执行中任务完成，共采集156条订单'),(10,1007,'合约平仓通知采集','2025-12-19 17:10:12',0,0,'MQ','com.rabbitmq.client.ShutdownSignalException: 队列 [contract-close-notify] 不存在',200,'qianqi','2025-12-19 17:10:12','2025-12-19 17:10:12','队列未提前创建，导致采集失败');
/*!40000 ALTER TABLE `crypto_collect_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto_dify_config`
--

DROP TABLE IF EXISTS `crypto_dify_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_dify_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `config_key` varchar(50) NOT NULL COMMENT '配置键',
  `config_value` text COMMENT '配置值',
  `config_type` varchar(20) DEFAULT NULL COMMENT '配置类型（API_URL/API_KEY/PROMPT等）',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_config_key` (`config_key`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dify智能体配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_dify_config`
--

LOCK TABLES `crypto_dify_config` WRITE;
/*!40000 ALTER TABLE `crypto_dify_config` DISABLE KEYS */;
INSERT INTO `crypto_dify_config` VALUES (1,'DIFY_API_URL','https://api.dify.ai/v1','API_URL','Dify API地址','2025-12-15 05:56:30','2025-12-15 05:56:30'),(2,'DIFY_API_KEY','','API_KEY','Dify API密钥（需要配置）','2025-12-15 05:56:30','2025-12-15 05:56:30'),(3,'DIFY_AGENT_ID_COLLECT','','AGENT_ID','消息采集智能体ID','2025-12-15 05:56:30','2025-12-15 05:56:30'),(4,'DIFY_AGENT_ID_ANALYSIS','','AGENT_ID','AI分析智能体ID','2025-12-15 05:56:30','2025-12-15 05:56:30'),(5,'PROMPT_FIRST_ANALYSIS','请分析以下数字货币消息，判断其对特定币种的影响方向和程度，输出情感倾向（利好/利空/中性）和影响等级（1-5）。','PROMPT','第一次分析Prompt','2025-12-15 05:56:30','2025-12-15 05:56:30'),(6,'PROMPT_SECOND_ANALYSIS','结合当前持仓结构和消息影响，分析持仓合理性，给出调整建议和分析依据。','PROMPT','第二次分析Prompt','2025-12-15 05:56:30','2025-12-15 05:56:30'),(7,'4',NULL,NULL,'r','2025-12-15 22:37:06','2025-12-15 22:37:06'),(8,'4555',NULL,NULL,NULL,'2025-12-16 14:06:46','2025-12-16 14:06:45');
/*!40000 ALTER TABLE `crypto_dify_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto_message`
--

DROP TABLE IF EXISTS `crypto_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID（主键）',
  `coin_type` varchar(50) DEFAULT NULL COMMENT '数字货币类型（BTC/ETH/SOL等）',
  `title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `content` text COMMENT '消息内容（长文本，适配大量内容存储）',
  `source` varchar(100) DEFAULT NULL COMMENT '消息来源（CoinGecko/Binance等）',
  `source_url` varchar(500) DEFAULT NULL COMMENT '原始链接',
  `sentiment` varchar(20) DEFAULT NULL COMMENT '情感倾向（利好/利空/中性）',
  `impact_level` tinyint(1) DEFAULT NULL COMMENT '影响程度（1-5，5为最高）',
  `analysis_result` varchar(500) DEFAULT NULL COMMENT 'AI第一次分析结果',
  `collect_time` date DEFAULT NULL COMMENT '采集时间',
  `status` char(1) DEFAULT '0' COMMENT '状态（0=正常，1=停用）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（继承BaseEntity）',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（继承BaseEntity）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_coin_type` (`coin_type`) USING BTREE,
  KEY `idx_sentiment` (`sentiment`) USING BTREE,
  KEY `idx_impact_level` (`impact_level`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_collect_time` (`collect_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数字货币消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_message`
--

LOCK TABLES `crypto_message` WRITE;
/*!40000 ALTER TABLE `crypto_message` DISABLE KEYS */;
INSERT INTO `crypto_message` VALUES (1,'BTC','比特币ETF资金流入创新高，机构投资者持续看好','根据最新数据，比特币ETF本周资金流入达到15亿美元，创历史新高。多家机构分析师认为，这反映了机构投资者对比特币长期价值的认可。','CoinGecko','https://www.coingecko.com/news/btc-etf-inflow','利好',5,'该消息对BTC构成重大利好。ETF资金流入创新高表明机构投资者信心增强，可能推动BTC价格上涨。影响等级：5/5，建议关注后续资金流向。','2025-12-15','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(2,'ETH','以太坊2.0质押量突破3000万ETH，网络安全性提升','以太坊2.0质押总量已突破3000万ETH，占总供应量的25%以上。质押量的持续增长表明社区对以太坊网络升级的信心。','Binance','https://www.binance.com/news/eth-staking','利好',4,'该消息对ETH构成利好。质押量增长表明网络安全性提升，同时减少了市场流通量，可能对价格产生正面影响。影响等级：4/5。','2025-12-14','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(3,'BTC','比特币挖矿难度再次上调，网络算力持续增长','比特币网络挖矿难度上调5.2%，达到历史新高。这反映了网络算力的持续增长和矿工对BTC的信心。','CoinGecko','https://www.coingecko.com/news/btc-mining','利好',3,'挖矿难度上调表明网络算力增长，这是BTC网络健康发展的标志。对价格影响中等，影响等级：3/5。','2025-12-13','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(4,'SOL','Solana生态DeFi项目总锁仓量突破50亿美元','Solana生态DeFi项目总锁仓量（TVL）突破50亿美元，创历史新高。多个头部项目宣布将在Solana上部署。','Binance','https://www.binance.com/news/sol-defi','利好',4,'该消息对SOL构成利好。TVL增长表明生态活跃度提升，可能吸引更多开发者和用户，推动SOL价格上涨。影响等级：4/5。','2025-12-12','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(5,'ETH','以太坊Gas费用持续下降，网络使用成本降低','以太坊网络Gas费用较上月下降30%，主要得益于Layer2解决方案的普及。这降低了用户使用以太坊网络的门槛。','CoinGecko','https://www.coingecko.com/news/eth-gas','利好',3,'Gas费用下降有利于提升以太坊网络的可访问性，可能吸引更多用户和项目。影响等级：3/5。','2025-12-11','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(6,'BTC','某大型机构宣布将BTC纳入储备资产','某知名投资机构宣布将BTC纳入其储备资产配置，计划在未来6个月内逐步增持。该机构管理资产规模超过1000亿美元。','CoinGecko','https://www.coingecko.com/news/btc-reserve','利好',5,'大型机构将BTC纳入储备资产是重大利好信号，可能引发其他机构跟风，推动BTC价格上涨。影响等级：5/5。','2025-12-10','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(7,'SOL','Solana网络出现短暂拥堵，交易处理速度下降','Solana网络在过去24小时内出现短暂拥堵，部分交易处理时间延长。开发团队正在优化网络性能。','Binance','https://www.binance.com/news/sol-congestion','利空',2,'网络拥堵可能影响用户体验，但属于短期技术问题。如果开发团队能快速解决，影响有限。影响等级：2/5。','2025-12-09','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(8,'ETH','以太坊核心开发者讨论延迟难度炸弹','以太坊核心开发者正在讨论是否延迟难度炸弹，以确保网络在合并前保持稳定。最终决定将在下周公布。','CoinGecko','https://www.coingecko.com/news/eth-difficulty','中性',2,'该消息对ETH影响中性。难度炸弹延迟是技术性决策，对价格影响有限。影响等级：2/5。','2025-12-08','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(9,'BTC','比特币价格突破关键阻力位，技术面看涨','比特币价格成功突破65000美元关键阻力位，技术分析师认为这是看涨信号，可能推动价格进一步上涨。','CoinGecko','https://www.coingecko.com/news/btc-breakout','利好',4,'突破关键阻力位是技术面利好信号，可能吸引更多技术交易者入场。影响等级：4/5。','2025-12-07','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(10,'ETH','以太坊Layer2解决方案Arbitrum日交易量创新高','Arbitrum日交易量突破200万笔，创历史新高。这表明Layer2解决方案正在被广泛采用。','Binance','https://www.binance.com/news/arbitrum','利好',3,'Layer2交易量增长有利于以太坊生态发展，但直接对ETH价格影响有限。影响等级：3/5。','2025-12-06','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(11,'SOL','Solana基金会宣布新的生态扶持计划','Solana基金会宣布将投入1亿美元用于生态项目扶持，重点支持DeFi、NFT和GameFi项目。','CoinGecko','https://www.coingecko.com/news/sol-fund','利好',4,'生态扶持计划有利于Solana生态发展，可能吸引更多项目入驻，推动SOL价格上涨。影响等级：4/5。','2025-12-05','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(12,'BTC','比特币网络哈希率创新高，网络安全增强','比特币网络哈希率达到600 EH/s，创历史新高。这反映了矿工对BTC的信心和网络的安全性提升。','Binance','https://www.binance.com/news/btc-hashrate','利好',3,'哈希率增长表明网络安全性提升，这是长期利好因素。影响等级：3/5。','2025-12-04','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(13,'ETH','以太坊开发者发布新版本客户端，性能优化','以太坊核心开发者发布新版本客户端，包含多项性能优化和bug修复。建议所有节点尽快升级。','CoinGecko','https://www.coingecko.com/news/eth-client','利好',2,'客户端升级是常规维护，对价格影响有限。影响等级：2/5。','2025-12-03','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(14,'SOL','Solana与多家传统金融机构达成合作','Solana宣布与多家传统金融机构达成合作，将在支付和结算领域探索区块链应用。','Binance','https://www.binance.com/news/sol-partnership','利好',4,'与传统金融机构合作有利于提升Solana的认可度和应用场景，可能推动SOL价格上涨。影响等级：4/5。','2025-12-02','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(15,'BTC','比特币现货ETF交易量持续增长','比特币现货ETF日交易量达到50亿美元，创历史新高。这表明市场对比特币ETF的需求持续增长。','CoinGecko','https://www.coingecko.com/news/btc-etf-volume','利好',4,'ETF交易量增长表明市场活跃度提升，可能推动BTC价格上涨。影响等级：4/5。','2025-12-01','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(16,'ETH','以太坊质押收益率下降至3.5%','以太坊质押收益率从4.2%下降至3.5%，主要由于质押量持续增长。这反映了市场对以太坊2.0的信心。','Binance','https://www.binance.com/news/eth-yield','中性',2,'质押收益率下降是市场供需关系的正常反映，对价格影响有限。影响等级：2/5。','2025-11-30','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(17,'SOL','Solana网络升级完成，TPS提升至65000','Solana网络完成最新升级，理论TPS从50000提升至65000。这将进一步提升网络处理能力。','CoinGecko','https://www.coingecko.com/news/sol-upgrade','利好',3,'网络性能提升有利于吸引更多应用，但需要时间验证。影响等级：3/5。','2025-11-29','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(18,'BTC','比特币鲸鱼地址增持10000枚BTC','某大型比特币鲸鱼地址在过去一周增持10000枚BTC，价值约6.5亿美元。这可能表明大额持有者看好BTC长期价值。','Binance','https://www.binance.com/news/btc-whale','利好',4,'鲸鱼增持是看涨信号，可能推动BTC价格上涨。影响等级：4/5。','2025-11-28','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(19,'ETH','以太坊DeFi总锁仓量突破1000亿美元','以太坊DeFi生态总锁仓量突破1000亿美元，创历史新高。多个头部DeFi项目TVL均实现增长。','CoinGecko','https://www.coingecko.com/news/eth-defi','利好',4,'DeFi TVL增长表明生态活跃度提升，有利于ETH价格上涨。影响等级：4/5。','2025-11-27','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(20,'SOL','Solana手机Saga销量超预期，生态应用增长','Solana手机Saga销量超预期，带动Solana生态应用下载量增长50%。这提升了Solana的移动端生态。','Binance','https://www.binance.com/news/sol-phone','利好',3,'手机销量增长有利于Solana生态扩展，但需要时间验证长期影响。影响等级：3/5。','2025-11-26','0','2025-12-16 07:47:21','2025-12-16 07:47:21'),(21,NULL,'返回毫不怀疑他',NULL,NULL,NULL,NULL,0,NULL,'2025-12-01','0','2025-12-16 15:47:36','2025-12-16 15:47:36');
/*!40000 ALTER TABLE `crypto_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto_position`
--

DROP TABLE IF EXISTS `crypto_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_position` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '持仓ID（主键）',
  `coin_type` varchar(50) NOT NULL COMMENT '数字货币类型（如BTC/ETH/SOL等）',
  `amount` decimal(20,8) DEFAULT NULL COMMENT '持仓数量（支持8位小数，适配数字货币小额精度需求）',
  `percentage` decimal(5,2) DEFAULT NULL COMMENT '持仓占比（百分比，保留2位小数，如25.50%）',
  `usd_value` decimal(20,2) DEFAULT NULL COMMENT '美元价值（保留2位小数，符合金融数据展示规范）',
  `price` decimal(20,4) DEFAULT NULL COMMENT '当前价格（USD，保留4位小数，适配数字货币价格波动精度）',
  `snapshot_date` date NOT NULL COMMENT '快照日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（继承BaseEntity）',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（继承BaseEntity）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_coin_type` (`coin_type`) USING BTREE,
  KEY `idx_snapshot_date` (`snapshot_date`) USING BTREE,
  KEY `idx_coin_snapshot` (`coin_type`,`snapshot_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='持仓数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_position`
--

LOCK TABLES `crypto_position` WRITE;
/*!40000 ALTER TABLE `crypto_position` DISABLE KEYS */;
INSERT INTO `crypto_position` VALUES (1,'BTC',1.85623450,42.50,83530.55,45000.2500,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(2,'ETH',12.34567890,31.20,25925.92,2100.0000,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(3,'SOL',89.76543210,12.80,10771.85,120.0000,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(4,'APT',234.56789012,6.50,3518.52,15.0000,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(5,'USDT',12500.00000000,7.00,12500.00,1.0000,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(6,'ARB',156.78901234,4.80,2351.84,15.0000,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(7,'DOT',98.76543210,3.20,1481.48,15.0000,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(8,'ADA',1234.56789012,2.00,864.20,0.7000,'2025-12-16','2025-12-16 08:10:22','2025-12-16 08:10:22'),(10,'ADA',44.00000000,553.00,8598.00,569.0000,'2025-12-07','2025-12-16 16:12:19','2025-12-16 16:12:19');
/*!40000 ALTER TABLE `crypto_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto_position_history`
--

DROP TABLE IF EXISTS `crypto_position_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_position_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '历史记录ID（主键）',
  `coin_type` varchar(50) NOT NULL COMMENT '数字货币类型（如BTC/ETH/SOL等）',
  `amount` decimal(20,8) DEFAULT NULL COMMENT '持仓数量（支持8位小数，适配数字货币小额精度）',
  `percentage` decimal(5,2) DEFAULT NULL COMMENT '持仓占比（百分比，保留2位小数）',
  `usd_value` decimal(20,2) DEFAULT NULL COMMENT '美元价值（保留2位小数，符合金融规范）',
  `price` decimal(20,4) DEFAULT NULL COMMENT '价格（USD，保留4位小数，适配价格波动）',
  `change_type` varchar(30) DEFAULT NULL COMMENT '变更类型（手动调整/AI建议/定时更新）',
  `change_reason` varchar(500) DEFAULT NULL COMMENT '变更原因（详细描述变更背景）',
  `snapshot_date` date NOT NULL COMMENT '快照日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（继承BaseEntity）',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（继承BaseEntity）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_coin_type` (`coin_type`) USING BTREE,
  KEY `idx_snapshot_date` (`snapshot_date`) USING BTREE,
  KEY `idx_change_type` (`change_type`) USING BTREE,
  KEY `idx_coin_date_change` (`coin_type`,`snapshot_date`,`change_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='持仓历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_position_history`
--

LOCK TABLES `crypto_position_history` WRITE;
/*!40000 ALTER TABLE `crypto_position_history` DISABLE KEYS */;
INSERT INTO `crypto_position_history` VALUES (1,'BTC',1.50000000,38.20,67500.38,45000.2500,'定时更新','每日持仓快照，BTC价格稳定，持仓无变化','2025-12-14','2025-12-16 08:17:25','2025-12-16 08:17:25'),(2,'BTC',1.50000000,38.20,67500.38,45000.2500,'AI建议','AI分析BTC ETF获批利好，建议加仓0.3562345个，提升占比至42.5%','2025-12-15','2025-12-16 08:17:25','2025-12-16 08:17:25'),(3,'BTC',1.85623450,42.50,83530.55,45000.2500,'手动调整','执行AI建议，通过交易所API加仓0.3562345 BTC，成交均价45000.25 USD','2025-12-16','2025-12-16 08:17:25','2025-12-16 08:17:25'),(4,'ETH',10.00000000,28.50,21000.00,2100.0000,'定时更新','每日持仓快照，ETHLayer2生态无重大消息，持仓保持不变','2025-12-14','2025-12-16 08:17:25','2025-12-16 08:17:25'),(5,'ETH',12.34567890,31.20,25925.92,2100.0000,'手动调整','看好以太坊DVT升级预期，手动加仓2.3456789 ETH，平均成本2100 USD','2025-12-16','2025-12-16 08:17:25','2025-12-16 08:17:25'),(6,'SOL',100.00000000,15.30,12000.00,120.0000,'定时更新','每日持仓快照，Solana网络稳定，持仓无变化','2025-12-14','2025-12-16 08:17:25','2025-12-16 08:17:25'),(7,'SOL',89.76543210,12.80,10771.85,120.0000,'手动调整','Solana竞品Aptos推出新功能，短期分散风险，减仓10.2345679 SOL','2025-12-15','2025-12-16 08:17:25','2025-12-16 08:17:25'),(8,'APT',0.00000000,0.00,0.00,15.0000,'AI建议','AI分析APT生态发展迅猛，建议新增持仓配置，初始目标占比6.5%','2025-12-15','2025-12-16 08:17:25','2025-12-16 08:17:25'),(9,'APT',234.56789012,6.50,3518.52,15.0000,'手动调整','执行AI新增持仓建议，买入234.56789012 APT，成交均价15 USD','2025-12-16','2025-12-16 08:17:25','2025-12-16 08:17:25'),(10,'USDT',10000.00000000,5.80,10000.00,1.0000,'定时更新','每日持仓快照，无资金进出，持仓保持不变','2025-12-14','2025-12-16 08:17:25','2025-12-16 08:17:25'),(11,'USDT',12500.00000000,7.00,12500.00,1.0000,'手动调整','为加仓BTC/APT准备流动性，充值2500 USDT至交易所账户','2025-12-15','2025-12-16 08:17:25','2025-12-16 08:17:25'),(12,'ARB',120.00000000,3.90,1800.00,15.0000,'定时更新','每日持仓快照，Arbitrum网络锁仓量稳定，持仓无变化','2025-12-14','2025-12-16 08:17:25','2025-12-16 08:17:25'),(13,'ARB',156.78901234,4.80,2351.84,15.0000,'AI建议','AI分析Layer2叙事升温，建议加仓ARB至4.8%占比，提升生态曝光','2025-12-16','2025-12-16 08:17:25','2025-12-16 08:17:25'),(14,'DOT',98.76543210,3.20,1481.48,15.0000,'定时更新','每日持仓快照，Polkadot跨链生态无重大进展，持仓保持不变','2025-12-14','2025-12-16 08:17:25','2025-12-16 08:17:25'),(15,'DOT',98.76543210,3.20,1481.48,15.0000,'定时更新','每日持仓快照，DOT价格稳定，持仓占比无变化','2025-12-16','2025-12-16 08:17:25','2025-12-16 08:17:25'),(16,'ADA',1500.00000000,2.80,1050.00,0.7000,'定时更新','每日持仓快照，Cardano开发进度不及预期，持仓暂未调整','2025-12-14','2025-12-16 08:17:25','2025-12-16 08:17:25'),(17,'ADA',1234.56789012,2.00,864.20,0.7000,'手动调整','降低低流动性资产占比，减仓265.43210988 ADA，优化持仓结构','2025-12-15','2025-12-16 08:17:25','2025-12-16 08:17:25'),(18,'BTC',4444.00000000,265.00,263.00,NULL,NULL,NULL,'2025-10-07','2025-12-16 16:17:59','2025-12-16 16:17:59');
/*!40000 ALTER TABLE `crypto_position_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto_review_log`
--

DROP TABLE IF EXISTS `crypto_review_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_review_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '审核记录ID',
  `report_id` bigint NOT NULL COMMENT '报告ID',
  `reviewer_id` bigint NOT NULL COMMENT '审核人ID',
  `reviewer_name` varchar(50) DEFAULT NULL COMMENT '审核人姓名',
  `review_result` varchar(20) NOT NULL COMMENT '审核结果（APPROVED/REJECTED）',
  `review_comment` varchar(500) DEFAULT NULL COMMENT '审核意见',
  `review_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `idx_report_id` (`report_id`),
  KEY `idx_reviewer_id` (`reviewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='审核记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_review_log`
--

LOCK TABLES `crypto_review_log` WRITE;
/*!40000 ALTER TABLE `crypto_review_log` DISABLE KEYS */;
INSERT INTO `crypto_review_log` VALUES (1,2,1,'管理员','APPROVED','同意AI建议，保持现有持仓结构','2025-12-14 00:00:00'),(2,4,1,'管理员','REJECTED','技术面突破属于短期信号，不建议调整持仓','2025-12-12 12:33:38'),(3,2,3,'放入发','分vvv额v',NULL,'2025-12-16 14:17:38'),(4,4,4,'lhy','ai',NULL,'2025-12-28 00:00:00');
/*!40000 ALTER TABLE `crypto_review_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'crypto_ai_report','AI分析报告表',NULL,NULL,'CryptoAiReport','crud','element-ui','com.ruoyi.system','system','report','AI分析报告','lhy','0','/','{}','admin','2025-12-15 13:56:57','','2025-12-16 15:19:45',NULL),(2,'crypto_collect_log','消息采集任务日志表',NULL,NULL,'CryptoCollectLog','crud','','com.ruoyi.system','system','log','消息采集任务日志','ruoyi','0','/',NULL,'admin','2025-12-15 13:56:57','',NULL,NULL),(3,'crypto_dify_config','Dify智能体配置表',NULL,NULL,'CryptoDifyConfig','crud','element-ui','com.ruoyi.system','system','difyconfig','Dify智能体配置','lhy','0','/','{\"parentMenuId\":1}','admin','2025-12-15 13:56:58','','2025-12-15 14:08:31',NULL),(4,'crypto_message','数字货币消息表',NULL,NULL,'CryptoMessage','crud','element-ui','com.ruoyi.system','system','message','数字货币消息','lhy','0','/','{\"parentMenuId\":2000}','admin','2025-12-15 13:56:58','','2025-12-16 15:15:53',NULL),(5,'crypto_position','持仓数据表',NULL,NULL,'CryptoPosition','crud','element-ui','com.ruoyi.system','system','position','持仓数据','lhy','0','/','{\"parentMenuId\":0}','admin','2025-12-15 13:56:58','','2025-12-16 16:05:53',NULL),(6,'crypto_position_history','持仓历史记录表',NULL,NULL,'CryptoPositionHistory','crud','element-ui','com.ruoyi.system','system','history','持仓历史记录','lhy','0','/','{\"parentMenuId\":3}','admin','2025-12-15 13:56:58','','2025-12-16 16:12:53',NULL),(7,'crypto_review_log','审核记录表',NULL,NULL,'CryptoReviewLog','crud','element-ui','com.ruoyi.system','system','log','审核记录','lhy','0','/','{\"parentMenuId\":3}','admin','2025-12-15 13:56:58','','2025-12-15 20:58:43',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id','报告ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(2,1,'message_id','关联消息ID','bigint','Long','messageId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(3,1,'report_date','报告日期','date','Date','reportDate','0','0','1','1','1','1','1','EQ','datetime','',3,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(4,1,'first_analysis','第一次分析结果（消息情感分析）','text','String','firstAnalysis','0','0','0','1','1','1','1','EQ','textarea','',4,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(5,1,'position_snapshot','持仓快照（JSON格式）','text','String','positionSnapshot','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(6,1,'second_analysis','第二次分析结果（持仓匹配分析）','text','String','secondAnalysis','0','0','0','1','1','1','1','EQ','textarea','',6,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(7,1,'adjustment_suggestion','调整建议（JSON格式）','text','String','adjustmentSuggestion','0','0','0','1','1','1','1','EQ','textarea','',7,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(8,1,'analysis_basis','分析依据','text','String','analysisBasis','0','0','0','1','1','1','1','EQ','textarea','',8,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(9,1,'report_status','报告状态（PENDING待审核/APPROVED已通过/REJECTED已驳回）','varchar(20)','String','reportStatus','0','0','0','1','1','1','1','EQ','radio','',9,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(10,1,'reviewer_id','审核人ID','bigint','Long','reviewerId','0','0','0','1','1','1','1','EQ','input','',10,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(11,1,'review_time','审核时间','datetime','Date','reviewTime','0','0','0','1','1','1','1','EQ','datetime','',11,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(12,1,'reject_reason','驳回原因','varchar(500)','String','rejectReason','0','0','0','1','1','1','1','EQ','textarea','',12,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(13,1,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',13,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(14,1,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',14,'admin','2025-12-15 13:56:57','','2025-12-16 15:19:45'),(15,2,'id','日志ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-15 13:56:57','',NULL),(16,2,'task_date','任务日期','date','Date','taskDate','0','0','1','1','1','1','1','EQ','datetime','',2,'admin','2025-12-15 13:56:57','',NULL),(17,2,'collect_status','采集状态（SUCCESS/FAILED/RETRY）','varchar(20)','String','collectStatus','0','0','1','1','1','1','1','EQ','radio','',3,'admin','2025-12-15 13:56:57','',NULL),(18,2,'message_count','采集消息数量','int','Long','messageCount','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-12-15 13:56:57','',NULL),(19,2,'error_message','错误信息','text','String','errorMessage','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-12-15 13:56:57','',NULL),(20,2,'retry_count','重试次数','int','Long','retryCount','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-12-15 13:56:57','',NULL),(21,2,'execute_time','执行时间','datetime','Date','executeTime','0','0','0','1','1','1','1','EQ','datetime','',7,'admin','2025-12-15 13:56:57','',NULL),(22,2,'duration','执行时长（毫秒）','int','Long','duration','0','0','0','1','1','1','1','EQ','input','',8,'admin','2025-12-15 13:56:57','',NULL),(23,3,'id','配置ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-15 13:56:58','','2025-12-15 14:08:31'),(24,3,'config_key','配置键','varchar(50)','String','configKey','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-12-15 13:56:58','','2025-12-15 14:08:31'),(25,3,'config_value','配置值','text','String','configValue','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-12-15 13:56:58','','2025-12-15 14:08:31'),(26,3,'config_type','配置类型（API_URL/API_KEY/PROMPT等）','varchar(20)','String','configType','0','0','0','1','1','1','1','EQ','select','',4,'admin','2025-12-15 13:56:58','','2025-12-15 14:08:31'),(27,3,'description','描述','varchar(200)','String','description','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-12-15 13:56:58','','2025-12-15 14:08:31'),(28,3,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2025-12-15 13:56:58','','2025-12-15 14:08:31'),(29,3,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',7,'admin','2025-12-15 13:56:58','','2025-12-15 14:08:31'),(30,4,'id','消息ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:53'),(31,4,'coin_type','数字货币类型（BTC/ETH/SOL等）','varchar(20)','String','coinType','0','0','1','1','1','1','1','EQ','select','',2,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:53'),(32,4,'title','消息标题','varchar(500)','String','title','0','0','1','1','1','1','1','EQ','textarea','',3,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(33,4,'content','消息内容','text','String','content','0','0','0','1','1','1','1','EQ','editor','',4,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(34,4,'source','消息来源（CoinGecko/Binance等）','varchar(100)','String','source','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(35,4,'source_url','原始链接','varchar(500)','String','sourceUrl','0','0','0','1','1','1','1','EQ','textarea','',6,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(36,4,'sentiment','情感倾向（利好/利空/中性）','varchar(10)','String','sentiment','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(37,4,'impact_level','影响程度（1-5，5为最高）','int','Long','impactLevel','0','0','0','1','1','1','1','EQ','input','',8,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(38,4,'analysis_result','AI第一次分析结果','text','String','analysisResult','0','0','0','1','1','1','1','EQ','textarea','',9,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(39,4,'collect_time','采集时间','datetime','Date','collectTime','0','0','1','1','1','1','1','EQ','datetime','',10,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(40,4,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(41,4,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',12,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(42,4,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',13,'admin','2025-12-15 13:56:58','','2025-12-16 15:15:54'),(43,5,'id','持仓ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(44,5,'coin_type','数字货币类型','varchar(20)','String','coinType','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(45,5,'amount','持仓数量','decimal(20,8)','BigDecimal','amount','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(46,5,'percentage','持仓占比（百分比）','decimal(5,2)','BigDecimal','percentage','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(47,5,'usd_value','美元价值','decimal(20,2)','BigDecimal','usdValue','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(48,5,'price','当前价格（USD）','decimal(20,8)','BigDecimal','price','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(49,5,'snapshot_date','快照日期','date','Date','snapshotDate','0','0','1','1','1','1','1','EQ','datetime','',7,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(50,5,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(51,5,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',9,'admin','2025-12-15 13:56:58','','2025-12-16 16:05:53'),(52,6,'id','历史记录ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(53,6,'coin_type','数字货币类型','varchar(20)','String','coinType','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(54,6,'amount','持仓数量','decimal(20,8)','BigDecimal','amount','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(55,6,'percentage','持仓占比','decimal(5,2)','BigDecimal','percentage','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(56,6,'usd_value','美元价值','decimal(20,2)','BigDecimal','usdValue','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(57,6,'price','价格（USD）','decimal(20,8)','BigDecimal','price','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(58,6,'change_type','变更类型（手动调整/AI建议/定时更新）','varchar(20)','String','changeType','0','0','0','1','1','1','1','EQ','select','',7,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(59,6,'change_reason','变更原因','varchar(500)','String','changeReason','0','0','0','1','1','1','1','EQ','textarea','',8,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(60,6,'snapshot_date','快照日期','date','Date','snapshotDate','0','0','1','1','1','1','1','EQ','datetime','',9,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(61,6,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2025-12-15 13:56:58','','2025-12-16 16:12:53'),(62,7,'id','审核记录ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-15 13:56:58','','2025-12-15 20:58:43'),(63,7,'report_id','报告ID','bigint','Long','reportId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-12-15 13:56:58','','2025-12-15 20:58:43'),(64,7,'reviewer_id','审核人ID','bigint','Long','reviewerId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-12-15 13:56:58','','2025-12-15 20:58:43'),(65,7,'reviewer_name','审核人姓名','varchar(50)','String','reviewerName','0','0','0','1','1','1','1','LIKE','input','',4,'admin','2025-12-15 13:56:58','','2025-12-15 20:58:43'),(66,7,'review_result','审核结果（APPROVED/REJECTED）','varchar(20)','String','reviewResult','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-12-15 13:56:58','','2025-12-15 20:58:43'),(67,7,'review_comment','审核意见','varchar(500)','String','reviewComment','0','0','0','1','1','1','1','EQ','textarea','',6,'admin','2025-12-15 13:56:58','','2025-12-15 20:58:43'),(68,7,'review_time','审核时间','datetime','Date','reviewTime','0','0','0','1','1','1','1','EQ','datetime','',7,'admin','2025-12-15 13:56:58','','2025-12-15 20:58:43');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-12-15 05:48:48','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-12-15 05:48:48','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-12-15 05:48:48','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-12-15 05:48:48','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-12-15 05:48:48','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-12-15 05:48:48','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）'),(7,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2025-12-15 05:48:48','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(8,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2025-12-15 05:48:48','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-15 05:48:45','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-12-15 05:48:48','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-12-15 05:48:48','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-12-15 05:48:48','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-12-15 05:48:48','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-12-15 05:48:48','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-12-15 05:48:48','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-12-15 05:48:48','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-12-15 05:48:48','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-12-15 05:48:48','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-12-15 05:48:48','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-12-15 05:48:48','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-12-15 05:48:48','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-12-15 05:48:48','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-12-15 05:48:48','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-12-15 05:48:48','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-12-15 05:48:48','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-12-15 05:48:48','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-12-15 05:48:48','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-12-15 05:48:48','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-12-15 05:48:48','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-12-15 05:48:48','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-12-15 05:48:47','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-12-15 05:48:47','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-12-15 05:48:47','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-12-15 05:48:47','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-12-15 05:48:47','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-12-15 05:48:47','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-12-15 05:48:48','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-12-15 05:48:48','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-12-15 05:48:48','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-12-15 05:48:48','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-12-15 05:48:48','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-12-15 05:48:48','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-12-15 05:48:48','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','1','验证码已失效','2025-12-15 13:54:07'),(101,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-15 13:55:44'),(102,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-15 14:30:33'),(103,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','1','验证码错误','2025-12-15 18:58:14'),(104,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-15 18:58:18'),(105,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-15 20:03:32'),(106,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-15 20:06:04'),(107,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-15 20:06:11'),(108,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-15 20:16:36'),(109,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-15 20:17:26'),(110,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-15 21:31:30'),(111,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-15 21:31:32'),(112,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-15 22:36:01'),(113,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-16 14:05:57'),(114,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-16 17:32:43'),(115,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-16 17:34:56'),(116,'ry','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-16 17:35:04'),(117,'ry','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-16 22:38:02'),(118,'ry','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-16 22:38:55'),(119,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','1','验证码错误','2025-12-16 22:39:06'),(120,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-16 22:39:10'),(121,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-16 22:51:06'),(122,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','退出成功','2025-12-16 23:00:18'),(123,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','1','验证码已失效','2025-12-16 23:02:32'),(124,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-16 23:02:37'),(125,'admin','127.0.0.1','内网IP','Edge 142','Windows >=10','0','登录成功','2025-12-16 23:05:37'),(126,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2025-12-17 12:02:28'),(127,'admin','127.0.0.1','内网IP','TraeCN 1.104.3','Windows 10.0','0','登录成功','2025-12-17 12:18:27'),(128,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2025-12-19 22:36:10'),(129,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2025-12-19 22:59:33'),(130,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2025-12-19 23:17:14'),(131,'ry','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2025-12-19 23:17:14'),(132,'ry','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2025-12-19 23:17:29'),(133,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2025-12-19 23:17:38');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-12-15 05:48:45','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-12-15 05:48:45','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-12-15 05:48:45','',NULL,'系统工具目录'),(4,'若依',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','1','0','','guide','admin','2025-12-15 05:48:45','admin','2025-12-15 21:02:46','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-12-15 05:48:45','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-12-15 05:48:45','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-12-15 05:48:45','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-12-15 05:48:45','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-12-15 05:48:45','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-12-15 05:48:45','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-12-15 05:48:45','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-12-15 05:48:45','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-12-15 05:48:45','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-12-15 05:48:45','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-12-15 05:48:45','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2025-12-15 05:48:45','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-12-15 05:48:46','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-12-15 05:48:46','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-12-15 05:48:46','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-12-15 05:48:46','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-12-15 05:48:46','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-12-15 05:48:46','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-12-15 05:48:46','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-12-15 05:48:46','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-12-15 05:48:46','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-12-15 05:48:46','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-12-15 05:48:46','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-12-15 05:48:46','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-12-15 05:48:46','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-12-15 05:48:46','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-12-15 05:48:46','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-12-15 05:48:46','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-12-15 05:48:46','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-12-15 05:48:46','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-12-15 05:48:46','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-12-15 05:48:46','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-12-15 05:48:46','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-12-15 05:48:46','',NULL,''),(2000,'Dify智能体配置',0,0,'difyconfig','system/difyconfig/index',NULL,'',1,0,'C','0','0','system:difyconfig:list','button','admin','2025-12-15 06:01:22','admin','2025-12-15 14:19:45','Dify智能体配置菜单'),(2001,'Dify智能体配置查询',2000,1,'#','',NULL,'',1,0,'F','0','0','system:difyconfig:query','#','admin','2025-12-15 06:01:22','',NULL,''),(2002,'Dify智能体配置新增',2000,2,'#','',NULL,'',1,0,'F','0','0','system:difyconfig:add','#','admin','2025-12-15 06:01:22','',NULL,''),(2003,'Dify智能体配置修改',2000,3,'#','',NULL,'',1,0,'F','0','0','system:difyconfig:edit','#','admin','2025-12-15 06:01:22','',NULL,''),(2004,'Dify智能体配置删除',2000,4,'#','',NULL,'',1,0,'F','0','0','system:difyconfig:remove','#','admin','2025-12-15 06:01:22','',NULL,''),(2005,'Dify智能体配置导出',2000,5,'#','',NULL,'',1,0,'F','0','0','system:difyconfig:export','#','admin','2025-12-15 06:01:22','',NULL,''),(2006,'数字货币消息',0,0,'message','system/message/index',NULL,'',1,0,'C','0','0','system:message:list','clipboard','admin','2025-12-15 06:21:45','admin','2025-12-15 19:12:34','数字货币消息菜单'),(2007,'数字货币消息查询',2006,1,'#','',NULL,'',1,0,'F','0','0','system:message:query','#','admin','2025-12-15 06:21:45','',NULL,''),(2008,'数字货币消息新增',2006,2,'#','',NULL,'',1,0,'F','0','0','system:message:add','#','admin','2025-12-15 06:21:45','',NULL,''),(2009,'数字货币消息修改',2006,3,'#','',NULL,'',1,0,'F','0','0','system:message:edit','#','admin','2025-12-15 06:21:45','',NULL,''),(2010,'数字货币消息删除',2006,4,'#','',NULL,'',1,0,'F','0','0','system:message:remove','#','admin','2025-12-15 06:21:45','',NULL,''),(2011,'数字货币消息导出',2006,5,'#','',NULL,'',1,0,'F','0','0','system:message:export','#','admin','2025-12-15 06:21:45','',NULL,''),(2012,'持仓数据',0,0,'position','system/position/index',NULL,'',1,0,'C','0','0','system:position:list','number','admin','2025-12-15 11:05:29','admin','2025-12-15 20:19:01','持仓数据菜单'),(2013,'持仓数据查询',2012,1,'#','',NULL,'',1,0,'F','0','0','system:position:query','#','admin','2025-12-15 11:05:29','',NULL,''),(2014,'持仓数据新增',2012,2,'#','',NULL,'',1,0,'F','0','0','system:position:add','#','admin','2025-12-15 11:05:29','',NULL,''),(2015,'持仓数据修改',2012,3,'#','',NULL,'',1,0,'F','0','0','system:position:edit','#','admin','2025-12-15 11:05:29','',NULL,''),(2016,'持仓数据删除',2012,4,'#','',NULL,'',1,0,'F','0','0','system:position:remove','#','admin','2025-12-15 11:05:29','',NULL,''),(2017,'持仓数据导出',2012,5,'#','',NULL,'',1,0,'F','0','0','system:position:export','#','admin','2025-12-15 11:05:29','',NULL,''),(2024,'持仓历史记录',0,0,'history','system/history/index',NULL,'',1,0,'C','0','0','system:history:list','checkbox','admin','2025-12-15 12:21:35','admin','2025-12-15 20:27:01','持仓历史记录菜单'),(2025,'持仓历史记录查询',2024,1,'#','',NULL,'',1,0,'F','0','0','system:history:query','#','admin','2025-12-15 12:21:35','',NULL,''),(2026,'持仓历史记录新增',2024,2,'#','',NULL,'',1,0,'F','0','0','system:history:add','#','admin','2025-12-15 12:21:35','',NULL,''),(2027,'持仓历史记录修改',2024,3,'#','',NULL,'',1,0,'F','0','0','system:history:edit','#','admin','2025-12-15 12:21:35','',NULL,''),(2028,'持仓历史记录删除',2024,4,'#','',NULL,'',1,0,'F','0','0','system:history:remove','#','admin','2025-12-15 12:21:35','',NULL,''),(2029,'持仓历史记录导出',2024,5,'#','',NULL,'',1,0,'F','0','0','system:history:export','#','admin','2025-12-15 12:21:35','',NULL,''),(2030,'审核记录',0,0,'log','system/log/index',NULL,'',1,0,'C','0','0','system:log:list','component','admin','2025-12-15 12:31:03','admin','2025-12-15 20:32:58','审核记录菜单'),(2031,'审核记录查询',2030,1,'#','',NULL,'',1,0,'F','0','0','system:log:query','#','admin','2025-12-15 12:31:04','',NULL,''),(2032,'审核记录新增',2030,2,'#','',NULL,'',1,0,'F','0','0','system:log:add','#','admin','2025-12-15 12:31:04','',NULL,''),(2033,'审核记录修改',2030,3,'#','',NULL,'',1,0,'F','0','0','system:log:edit','#','admin','2025-12-15 12:31:04','',NULL,''),(2034,'审核记录删除',2030,4,'#','',NULL,'',1,0,'F','0','0','system:log:remove','#','admin','2025-12-15 12:31:04','',NULL,''),(2035,'审核记录导出',2030,5,'#','',NULL,'',1,0,'F','0','0','system:log:export','#','admin','2025-12-15 12:31:04','',NULL,''),(2036,'数字货币消息',2000,1,'message','system/message/index',NULL,'',1,0,'C','0','0','system:message:list','#','admin','2025-12-16 06:08:37','',NULL,'数字货币消息菜单'),(2037,'数字货币消息查询',2036,1,'#','',NULL,'',1,0,'F','0','0','system:message:query','#','admin','2025-12-16 06:08:37','',NULL,''),(2038,'数字货币消息新增',2036,2,'#','',NULL,'',1,0,'F','0','0','system:message:add','#','admin','2025-12-16 06:08:37','',NULL,''),(2039,'数字货币消息修改',2036,3,'#','',NULL,'',1,0,'F','0','0','system:message:edit','#','admin','2025-12-16 06:08:37','',NULL,''),(2040,'数字货币消息删除',2036,4,'#','',NULL,'',1,0,'F','0','0','system:message:remove','#','admin','2025-12-16 06:08:37','',NULL,''),(2041,'数字货币消息导出',2036,5,'#','',NULL,'',1,0,'F','0','0','system:message:export','#','admin','2025-12-16 06:08:37','',NULL,''),(2048,'数字货币消息',2000,1,'message','system/message/index',NULL,'',1,0,'C','0','0','system:message:list','#','admin','2025-12-16 06:16:58','',NULL,'数字货币消息菜单'),(2049,'数字货币消息查询',2048,1,'#','',NULL,'',1,0,'F','0','0','system:message:query','#','admin','2025-12-16 06:16:58','',NULL,''),(2050,'数字货币消息新增',2048,2,'#','',NULL,'',1,0,'F','0','0','system:message:add','#','admin','2025-12-16 06:16:58','',NULL,''),(2051,'数字货币消息修改',2048,3,'#','',NULL,'',1,0,'F','0','0','system:message:edit','#','admin','2025-12-16 06:16:58','',NULL,''),(2052,'数字货币消息删除',2048,4,'#','',NULL,'',1,0,'F','0','0','system:message:remove','#','admin','2025-12-16 06:16:58','',NULL,''),(2053,'数字货币消息导出',2048,5,'#','',NULL,'',1,0,'F','0','0','system:message:export','#','admin','2025-12-16 06:16:58','',NULL,''),(2054,'数字货币消息',2000,1,'message','system/message/index',NULL,'',1,0,'C','0','0','system:message:list','#','admin','2025-12-16 06:52:46','',NULL,'数字货币消息菜单'),(2055,'数字货币消息查询',2054,1,'#','',NULL,'',1,0,'F','0','0','system:message:query','#','admin','2025-12-16 06:52:46','',NULL,''),(2056,'数字货币消息新增',2054,2,'#','',NULL,'',1,0,'F','0','0','system:message:add','#','admin','2025-12-16 06:52:46','',NULL,''),(2057,'数字货币消息修改',2054,3,'#','',NULL,'',1,0,'F','0','0','system:message:edit','#','admin','2025-12-16 06:52:46','',NULL,''),(2058,'数字货币消息删除',2054,4,'#','',NULL,'',1,0,'F','0','0','system:message:remove','#','admin','2025-12-16 06:52:46','',NULL,''),(2059,'数字货币消息导出',2054,5,'#','',NULL,'',1,0,'F','0','0','system:message:export','#','admin','2025-12-16 06:52:46','',NULL,''),(2060,'AI分析报告',0,0,'report','system/report/index',NULL,'',1,0,'C','0','0','system:report:list','edit','admin','2025-12-16 07:20:55','admin','2025-12-16 15:25:26','AI分析报告菜单'),(2061,'AI分析报告查询',2060,1,'#','',NULL,'',1,0,'F','0','0','system:report:query','#','admin','2025-12-16 07:20:56','',NULL,''),(2062,'AI分析报告新增',2060,2,'#','',NULL,'',1,0,'F','0','0','system:report:add','#','admin','2025-12-16 07:20:56','',NULL,''),(2063,'AI分析报告修改',2060,3,'#','',NULL,'',1,0,'F','0','0','system:report:edit','#','admin','2025-12-16 07:20:56','',NULL,''),(2064,'AI分析报告删除',2060,4,'#','',NULL,'',1,0,'F','0','0','system:report:remove','#','admin','2025-12-16 07:20:56','',NULL,''),(2065,'AI分析报告导出',2060,5,'#','',NULL,'',1,0,'F','0','0','system:report:export','#','admin','2025-12-16 07:20:56','',NULL,''),(2072,'数字货币消息',2000,1,'message','system/message/index',NULL,'',1,0,'C','0','0','system:message:list','#','admin','2025-12-16 07:46:19','',NULL,'数字货币消息菜单'),(2073,'数字货币消息查询',2072,1,'#','',NULL,'',1,0,'F','0','0','system:message:query','#','admin','2025-12-16 07:46:19','',NULL,''),(2074,'数字货币消息新增',2072,2,'#','',NULL,'',1,0,'F','0','0','system:message:add','#','admin','2025-12-16 07:46:19','',NULL,''),(2075,'数字货币消息修改',2072,3,'#','',NULL,'',1,0,'F','0','0','system:message:edit','#','admin','2025-12-16 07:46:19','',NULL,''),(2076,'数字货币消息删除',2072,4,'#','',NULL,'',1,0,'F','0','0','system:message:remove','#','admin','2025-12-16 07:46:19','',NULL,''),(2077,'数字货币消息导出',2072,5,'#','',NULL,'',1,0,'F','0','0','system:message:export','#','admin','2025-12-16 07:46:19','',NULL,''),(2102,'消息采集任务日志',0,0,'log','system/log/index',NULL,'',1,0,'C','0','0','system:log:list','example','admin','2025-12-19 22:44:49','admin','2025-12-19 23:00:06','消息采集任务日志菜单'),(2103,'消息采集任务日志查询',2102,1,'#','',NULL,'',1,0,'F','0','0','system:log:query','#','admin','2025-12-19 22:44:49','',NULL,''),(2104,'消息采集任务日志新增',2102,2,'#','',NULL,'',1,0,'F','0','0','system:log:add','#','admin','2025-12-19 22:44:49','',NULL,''),(2105,'消息采集任务日志修改',2102,3,'#','',NULL,'',1,0,'F','0','0','system:log:edit','#','admin','2025-12-19 22:44:49','',NULL,''),(2106,'消息采集任务日志删除',2102,4,'#','',NULL,'',1,0,'F','0','0','system:log:remove','#','admin','2025-12-19 22:44:49','',NULL,''),(2107,'消息采集任务日志导出',2102,5,'#','',NULL,'',1,0,'F','0','0','system:log:export','#','admin','2025-12-19 22:44:49','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2025-12-15 05:48:48','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2025-12-15 05:48:48','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"crypto_dify_config,crypto_ai_report,crypto_collect_log,crypto_message,crypto_position,crypto_position_history,crypto_review_log\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 13:56:58',1239),(101,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"difyconfig\",\"className\":\"CryptoDifyConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"配置ID\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ConfigKey\",\"columnComment\":\"配置键\",\"columnId\":24,\"columnName\":\"config_key\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"configKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ConfigValue\",\"columnComment\":\"配置值\",\"columnId\":25,\"columnName\":\"config_value\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"configValue\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ConfigType\",\"columnComment\":\"配置类型（API_URL/API_KEY/PROMPT等）\",\"columnId\":26,\"columnName\":\"config_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"is','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 13:59:42',144),(102,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_dify_config\"}',NULL,0,NULL,'2025-12-15 13:59:51',709),(103,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"difyconfig\",\"className\":\"CryptoDifyConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"配置ID\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 13:59:42\",\"usableColumn\":false},{\"capJavaField\":\"ConfigKey\",\"columnComment\":\"配置键\",\"columnId\":24,\"columnName\":\"config_key\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"configKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 13:59:42\",\"usableColumn\":false},{\"capJavaField\":\"ConfigValue\",\"columnComment\":\"配置值\",\"columnId\":25,\"columnName\":\"config_value\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"configValue\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 13:59:42\",\"usableColumn\":false},{\"capJavaField\":\"ConfigType\",\"columnComment\":\"配置类型（API_URL/API_KEY/PROMPT等）\",\"columnId\":26,\"columnName\":\"config_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 14:03:29',105),(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"difyconfig\",\"className\":\"CryptoDifyConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"配置ID\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 14:03:29\",\"usableColumn\":false},{\"capJavaField\":\"ConfigKey\",\"columnComment\":\"配置键\",\"columnId\":24,\"columnName\":\"config_key\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"configKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 14:03:29\",\"usableColumn\":false},{\"capJavaField\":\"ConfigValue\",\"columnComment\":\"配置值\",\"columnId\":25,\"columnName\":\"config_value\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"configValue\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 14:03:29\",\"usableColumn\":false},{\"capJavaField\":\"ConfigType\",\"columnComment\":\"配置类型（API_URL/API_KEY/PROMPT等）\",\"columnId\":26,\"columnName\":\"config_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 14:08:31',98),(105,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/difyconfig/index\",\"createTime\":\"2025-12-15 06:01:22\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Dify智能体配置\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"difyconfig\",\"perms\":\"system:difyconfig:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 14:19:45',76),(106,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"message\",\"className\":\"CryptoMessage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"消息ID\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型（BTC/ETH/SOL等）\",\"columnId\":31,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"消息标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"消息内容\",\"columnId\":33,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"j','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 14:20:42',287),(107,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_message\"}',NULL,0,NULL,'2025-12-15 14:20:47',849),(108,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/message/index\",\"createTime\":\"2025-12-15 06:21:45\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"数字货币消息\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"message\",\"perms\":\"system:message:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 14:26:38',155),(109,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/crypto_message','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 14:31:42',294),(110,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','4 ','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-12-15 18:59:25',24),(111,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"position\",\"className\":\"CryptoPosition\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"持仓ID\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型\",\"columnId\":44,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"持仓数量\",\"columnId\":45,\"columnName\":\"amount\",\"columnType\":\"decimal(20,8)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"amount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Percentage\",\"columnComment\":\"持仓占比（百分比）\",\"columnId\":46,\"columnName\":\"percentage\",\"columnType\":\"decimal(5,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 19:04:16',177),(112,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_position\"}',NULL,0,NULL,'2025-12-15 19:04:24',348),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/position/index\",\"createTime\":\"2025-12-15 11:05:29\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"持仓数据\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"position\",\"perms\":\"system:position:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 19:11:50',124),(114,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/message/index\",\"createTime\":\"2025-12-15 06:21:45\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"数字货币消息\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"message\",\"perms\":\"system:message:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 19:12:34',39),(115,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"history\",\"className\":\"CryptoPositionHistory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"历史记录ID\",\"columnId\":52,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型\",\"columnId\":53,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"持仓数量\",\"columnId\":54,\"columnName\":\"amount\",\"columnType\":\"decimal(20,8)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"amount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Percentage\",\"columnComment\":\"持仓占比\",\"columnId\":55,\"columnName\":\"percentage\",\"columnType\":\"decimal(5,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRe','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 19:13:18',286),(116,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_position_history\"}',NULL,0,NULL,'2025-12-15 19:13:22',790),(117,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":44,\"changeReason\":\"212\",\"createTime\":\"2025-12-15 19:19:31\",\"params\":{},\"percentage\":52525,\"price\":455,\"snapshotDate\":\"2025-12-28\",\"usdValue\":5455} ',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'percentage\' at row 1\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                          change_reason,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'percentage\' at row 1\n; Data truncation: Out of range value for column \'percentage\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'percentage\' at row 1','2025-12-15 19:19:32',531),(118,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":44,\"changeReason\":\"212\",\"createTime\":\"2025-12-15 19:19:32\",\"params\":{},\"percentage\":52525,\"price\":455,\"snapshotDate\":\"2025-12-28\",\"usdValue\":5455} ',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'percentage\' at row 1\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                          change_reason,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'percentage\' at row 1\n; Data truncation: Out of range value for column \'percentage\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'percentage\' at row 1','2025-12-15 19:19:32',16),(119,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/position/index\",\"createTime\":\"2025-12-15 11:05:29\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"持仓数据\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"position\",\"perms\":\"system:position:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:19:01',78),(120,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 11:14:04\",\"icon\":\"input\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"持仓历史记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:19:20',39),(121,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":44,\"createTime\":\"2025-12-15 20:20:04\",\"params\":{},\"percentage\":55,\"price\":44,\"snapshotDate\":\"2025-12-16\",\"usdValue\":54} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                                       snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-15 20:20:04',179),(122,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 11:14:04\",\"icon\":\"input\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"持仓历史记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:20:30',39),(123,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":40,\"createTime\":\"2025-12-15 20:21:54\",\"params\":{},\"percentage\":44,\"snapshotDate\":\"2025-12-25\",\"usdValue\":4} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,                                                    snapshot_date,             create_time )           values ( ?,             ?,             ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-15 20:21:54',18),(124,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2024','127.0.0.1','内网IP','2024 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-15 20:22:54',17),(125,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2024','127.0.0.1','内网IP','2024 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-15 20:23:05',17),(126,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 12:21:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"持仓历史记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2018,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:23:34',33),(127,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2024','127.0.0.1','内网IP','2024 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-15 20:23:45',10),(128,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2020','127.0.0.1','内网IP','2020 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:23:48',40),(129,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2018','127.0.0.1','内网IP','2018 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-15 20:23:53',11),(130,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2019','127.0.0.1','内网IP','2019 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:23:58',61),(131,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2021','127.0.0.1','内网IP','2021 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:24:01',61),(132,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2022','127.0.0.1','内网IP','2022 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:24:03',58),(133,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2023','127.0.0.1','内网IP','2023 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:24:05',33),(134,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 12:21:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"持仓历史记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"修改菜单\'持仓历史记录\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2025-12-15 20:24:13',13),(135,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 12:21:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"持仓历史记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"修改菜单\'持仓历史记录\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2025-12-15 20:24:14',15),(136,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 12:21:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"持仓历史记录1\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:24:17',37),(137,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2018','127.0.0.1','内网IP','2018 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:24:21',34),(138,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 12:21:35\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"持仓历史记录1\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:26:53',28),(139,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/history/index\",\"createTime\":\"2025-12-15 12:21:35\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"持仓历史记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"history\",\"perms\":\"system:history:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:27:01',31),(140,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":4,\"createTime\":\"2025-12-15 20:27:24\",\"params\":{},\"percentage\":4,\"snapshotDate\":\"2025-12-22\",\"usdValue\":40} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,                                                    snapshot_date,             create_time )           values ( ?,             ?,             ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-15 20:27:24',14),(141,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"log\",\"className\":\"CryptoReviewLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"审核记录ID\",\"columnId\":62,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReportId\",\"columnComment\":\"报告ID\",\"columnId\":63,\"columnName\":\"report_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reportId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerId\",\"columnComment\":\"审核人ID\",\"columnId\":64,\"columnName\":\"reviewer_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reviewerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnComment\":\"审核人姓名\",\"columnId\":65,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"j','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:29:51',188),(142,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_review_log\"}',NULL,0,NULL,'2025-12-15 20:29:54',305),(143,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/log/index\",\"createTime\":\"2025-12-15 12:31:03\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"审核记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"system:log:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:32:58',31),(144,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"history\",\"className\":\"CryptoPositionHistory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"历史记录ID\",\"columnId\":52,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 19:13:18\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型\",\"columnId\":53,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 19:13:18\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"持仓数量\",\"columnId\":54,\"columnName\":\"amount\",\"columnType\":\"decimal(20,8)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"amount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 19:13:18\",\"usableColumn\":false},{\"capJavaField\":\"Percentage\",\"columnComment\":\"持仓占比\",\"columnId\":55,\"columnName\":\"percentage\",\"columnType\":\"decimal(5,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fals','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:58:33',235),(145,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"log\",\"className\":\"CryptoReviewLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"审核记录ID\",\"columnId\":62,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 20:29:51\",\"usableColumn\":false},{\"capJavaField\":\"ReportId\",\"columnComment\":\"报告ID\",\"columnId\":63,\"columnName\":\"report_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reportId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 20:29:51\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerId\",\"columnComment\":\"审核人ID\",\"columnId\":64,\"columnName\":\"reviewer_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reviewerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 20:29:51\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnComment\":\"审核人姓名\",\"columnId\":65,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":tru','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 20:58:43',118),(146,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-15 05:48:45\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 21:02:46',56),(147,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-22\",\"content\":\"换个环境\",\"createTime\":\"2025-12-15 21:05:38\",\"params\":{},\"title\":\"那你\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                                                                              collect_time,             create_time )           values ( ?,             ?,                                                                              ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-15 21:05:38',191),(148,'Dify智能体配置',1,'com.ruoyi.system.controller.CryptoDifyConfigController.add()','POST',1,'admin','研发部门','/system/difyconfig','127.0.0.1','内网IP','{\"configKey\":\"4\",\"createTime\":\"2025-12-15 22:37:06\",\"description\":\"r\",\"id\":7,\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-15 22:37:06',66),(149,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-29\",\"content\":\"惹风波过后\",\"createTime\":\"2025-12-15 22:37:23\",\"params\":{},\"title\":\"二二\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                                                                              collect_time,             create_time )           values ( ?,             ?,                                                                              ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-15 22:37:23',167),(150,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":12,\"createTime\":\"2025-12-16 14:06:22\",\"params\":{},\"percentage\":25,\"snapshotDate\":\"2025-12-22\",\"usdValue\":55} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,                                                    snapshot_date,             create_time )           values ( ?,             ?,             ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:06:22',28),(151,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":12,\"createTime\":\"2025-12-16 14:06:27\",\"params\":{},\"percentage\":25,\"snapshotDate\":\"2025-12-22\",\"usdValue\":55} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,                                                    snapshot_date,             create_time )           values ( ?,             ?,             ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:06:27',13),(152,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":12,\"createTime\":\"2025-12-16 14:06:31\",\"params\":{},\"percentage\":25,\"snapshotDate\":\"2025-12-22\",\"usdValue\":55} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,                                                    snapshot_date,             create_time )           values ( ?,             ?,             ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:06:31',13),(153,'Dify智能体配置',1,'com.ruoyi.system.controller.CryptoDifyConfigController.add()','POST',1,'admin','研发部门','/system/difyconfig','127.0.0.1','内网IP','{\"configKey\":\"4555\",\"createTime\":\"2025-12-16 14:06:45\",\"id\":8,\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:06:45',23),(154,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-14\",\"content\":\"我说的\",\"createTime\":\"2025-12-16 14:06:59\",\"params\":{},\"title\":\"无线电厂\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                                                                              collect_time,             create_time )           values ( ?,             ?,                                                                              ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:06:59',11),(155,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-17\",\"content\":\"如果\",\"createTime\":\"2025-12-16 14:09:22\",\"params\":{},\"title\":\"ETF\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                                                                              collect_time,             create_time )           values ( ?,             ?,                                                                              ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:09:22',13),(156,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-16\",\"createTime\":\"2025-12-16 14:12:52\",\"params\":{},\"source\":\"他个人\",\"title\":\"好的话v和封闭环境\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,                          source,                                                                 collect_time,             create_time )           values ( ?,                          ?,                                                                 ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:12:52',16),(157,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":100,\"createTime\":\"2025-12-16 14:13:26\",\"params\":{},\"percentage\":778,\"snapshotDate\":\"2025-12-15\",\"usdValue\":34} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,                          snapshot_date,             create_time )           values ( ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:13:26',25),(158,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":744,\"createTime\":\"2025-12-16 14:17:15\",\"params\":{},\"percentage\":52,\"snapshotDate\":\"2025-12-16\",\"usdValue\":45} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,                          snapshot_date,             create_time )           values ( ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:17:15',14),(159,'审核记录',1,'com.ruoyi.system.controller.CryptoReviewLogController.add()','POST',1,'admin','研发部门','/system/log','127.0.0.1','内网IP','{\"id\":3,\"params\":{},\"reportId\":2,\"reviewResult\":\"分vvv额v\",\"reviewerId\":3,\"reviewerName\":\"放入发\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:17:38',27),(160,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":3,\"createTime\":\"2025-12-16 14:17:54\",\"params\":{},\"percentage\":34,\"snapshotDate\":\"2025-12-02\",\"usdValue\":324} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,                                                    snapshot_date,             create_time )           values ( ?,             ?,             ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:17:54',13),(161,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":3,\"changeReason\":\"财富聚集就\",\"createTime\":\"2025-12-16 14:18:02\",\"params\":{},\"percentage\":34,\"price\":74,\"snapshotDate\":\"2025-12-02\",\"usdValue\":324} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                          change_reason,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:18:02',12),(162,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":44,\"createTime\":\"2025-12-16 14:18:19\",\"params\":{},\"percentage\":55,\"price\":44,\"snapshotDate\":\"2025-12-23\",\"usdValue\":55} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,             price,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:18:19',15),(163,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":44,\"createTime\":\"2025-12-16 14:24:08\",\"params\":{},\"percentage\":55,\"price\":11,\"snapshotDate\":\"2025-12-15\",\"usdValue\":555} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,             price,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:24:08',21),(164,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-01\",\"content\":\"<strong>VFVR</strong>\",\"createTime\":\"2025-12-16 14:33:41\",\"params\":{},\"source\":\"VRTRHY\",\"title\":\"NihOn\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,             source,                                                                 collect_time,             create_time )           values ( ?,             ?,             ?,                                                                 ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:33:41',19),(165,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-01\",\"content\":\"<strong>VFVR</strong>\",\"createTime\":\"2025-12-16 14:51:50\",\"params\":{},\"source\":\"VRTRHY\",\"title\":\"NihOn\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,             source,                                                                 collect_time,             create_time )           values ( ?,             ?,             ?,                                                                 ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:51:50',42),(166,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":88,\"createTime\":\"2025-12-16 14:52:18\",\"params\":{},\"percentage\":55,\"price\":555,\"snapshotDate\":\"2025-12-01\",\"usdValue\":44} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,             price,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:52:18',16),(167,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":88,\"createTime\":\"2025-12-16 14:52:22\",\"params\":{},\"percentage\":55,\"price\":555,\"snapshotDate\":\"2025-12-01\",\"usdValue\":44} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,             price,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:52:22',18),(168,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2042','127.0.0.1','内网IP','2042 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-16 14:54:30',21),(169,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":44,\"createTime\":\"2025-12-16 14:54:59\",\"params\":{},\"percentage\":55,\"price\":77,\"snapshotDate\":\"2025-12-29\",\"usdValue\":66} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,             price,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 14:54:59',11),(170,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/position/index\",\"createTime\":\"2025-12-16 06:16:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"持仓数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"position\",\"perms\":\"system:position:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"修改菜单\'持仓数据\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2025-12-16 14:55:19',24),(171,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/position/index\",\"createTime\":\"2025-12-16 06:16:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"持仓数据1\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"position\",\"perms\":\"system:position:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:55:24',114),(172,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2043','127.0.0.1','内网IP','2043 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:55:30',46),(173,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2044','127.0.0.1','内网IP','2044 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:55:32',61),(174,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2045','127.0.0.1','内网IP','2045 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:55:34',32),(175,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2046','127.0.0.1','内网IP','2046 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:55:36',39),(176,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2047','127.0.0.1','内网IP','2047 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:55:38',30),(177,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2042','127.0.0.1','内网IP','2042 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 14:55:42',38),(178,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-07\",\"content\":\"\",\"createTime\":\"2025-12-16 15:04:58\",\"params\":{},\"title\":\"你就\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                                                                              collect_time,             create_time )           values ( ?,             ?,                                                                              ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:04:58',14),(179,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-07\",\"content\":\"你好好发挥v\",\"createTime\":\"2025-12-16 15:05:07\",\"params\":{},\"title\":\"你就\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                                                                              collect_time,             create_time )           values ( ?,             ?,                                                                              ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:05:07',14),(180,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-07\",\"content\":\"你好好发挥v\",\"createTime\":\"2025-12-16 15:05:46\",\"impactLevel\":3,\"params\":{},\"sentiment\":\"利好\",\"title\":\"你就\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                                       sentiment,             impact_level,                          collect_time,             create_time )           values ( ?,             ?,                                       ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:05:46',15),(181,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"analysisResult\":\"影响等级：5/5，建\",\"collectTime\":\"2025-12-07\",\"content\":\"你好好发挥v\",\"createTime\":\"2025-12-16 15:06:31\",\"impactLevel\":3,\"params\":{},\"sentiment\":\"利好\",\"source\":\"比特币ETF资金流入创新高，机构投资者持续看好\",\"sourceUrl\":\"https://www.coingecko.com/news/btc-etf-inflo\",\"title\":\"你就\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,             source,             source_url,             sentiment,             impact_level,             analysis_result,             collect_time,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:06:31',15),(182,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"analysisResult\":\"影响等级：5/5，建\",\"collectTime\":\"2025-12-07\",\"content\":\"\'比特币ETF资金流入创新高，机构投资者持续看好\', \'根据最新数据，比特币ETF本周资金流入达到15亿美元，创历史新高。多家机构分析师认为，这反映了机构投资者对比特币长期价值的认可。\",\"createTime\":\"2025-12-16 15:06:57\",\"impactLevel\":3,\"params\":{},\"sentiment\":\"利好\",\"source\":\"比特币ETF资金流入创新高，机构投资者持续看好\",\"sourceUrl\":\"https://www.coingecko.com/news/btc-etf-inflo\",\"title\":\"你就\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,             source,             source_url,             sentiment,             impact_level,             analysis_result,             collect_time,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:06:57',17),(183,'数字货币消息',2,'com.ruoyi.system.controller.CryptoMessageController.edit()','PUT',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"analysisResult\":\"该消息对ETH构成利好。质押量增长表明网络安全性提升，同时减少了市场流通量，可能对价格产生正面影响。影响等级：4/5。\",\"coinType\":\"ETH\",\"collectTime\":\"2025-12-13\",\"content\":\"以太坊2.0质押总量已突破3000万ETH，占总供应量的25%以上。质押量的持续增长表明社区对以太坊网络升级的信心。\",\"createTime\":\"2025-12-16 06:12:28\",\"id\":2,\"impactLevel\":4,\"params\":{},\"sentiment\":\"利好\",\"source\":\"Binance\",\"sourceUrl\":\"https://www.binance.com/news/eth-staking\",\"status\":\"0\",\"title\":\"以太坊2.0质押量突破3000万ETH，网络安全性提升\",\"updateTime\":\"2025-12-16 15:07:28\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:07:28',91),(184,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":5,\"createTime\":\"2025-12-16 15:07:44\",\"params\":{},\"percentage\":23,\"price\":34,\"snapshotDate\":\"2025-12-07\",\"usdValue\":34} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionMapper.insertCryptoPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position          ( amount,             percentage,             usd_value,             price,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:07:44',14),(185,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":7,\"changeReason\":\"每日持仓快照\",\"createTime\":\"2025-12-16 15:13:15\",\"params\":{},\"percentage\":5,\"price\":79,\"snapshotDate\":\"2025-12-01\",\"usdValue\":76} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                          change_reason,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:13:15',17),(186,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":7,\"changeReason\":\"每日持仓快照\",\"createTime\":\"2025-12-16 15:13:20\",\"params\":{},\"percentage\":5,\"price\":79,\"snapshotDate\":\"2025-12-01\",\"usdValue\":76} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                          change_reason,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:13:20',15),(187,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":7,\"changeReason\":\"每日持仓快照\",\"createTime\":\"2025-12-16 15:13:22\",\"params\":{},\"percentage\":5,\"price\":79,\"snapshotDate\":\"2025-12-01\",\"usdValue\":76} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                          change_reason,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:13:22',15),(188,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":7,\"changeReason\":\"每日持仓快照\",\"createTime\":\"2025-12-16 15:13:27\",\"params\":{},\"percentage\":5,\"price\":79,\"snapshotDate\":\"2025-12-01\",\"usdValue\":76} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoPositionHistoryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoPositionHistoryMapper.insertCryptoPositionHistory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_position_history          ( amount,             percentage,             usd_value,             price,                          change_reason,             snapshot_date,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:13:27',15),(189,'持仓历史记录',2,'com.ruoyi.system.controller.CryptoPositionHistoryController.edit()','PUT',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":1000,\"changeReason\":\"每日持仓快照\",\"changeType\":\"定时更新\",\"coinType\":\"ETH\",\"createTime\":\"2025-12-15 12:26:17\",\"id\":10,\"params\":{},\"percentage\":35,\"price\":3650,\"snapshotDate\":\"2025-12-10\",\"usdValue\":3500000} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:13:38',24),(190,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"message\",\"className\":\"CryptoMessage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"消息ID\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 14:31:41\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型（BTC/ETH/SOL等）\",\"columnId\":31,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 14:31:41\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"消息标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 14:31:41\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"消息内容\",\"columnId\":33,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":tru','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:15:54',285),(191,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-08\",\"createTime\":\"2025-12-16 15:17:18\",\"params\":{},\"title\":\"你好你好你好\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,                                                                                           collect_time,             create_time )           values ( ?,                                                                                           ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:17:18',13),(192,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-08\",\"content\":\"你回家路径马可马可结论\",\"createTime\":\"2025-12-16 15:17:45\",\"impactLevel\":5,\"params\":{},\"sentiment\":\"利好\",\"sourceUrl\":\"vntnthnjum\",\"title\":\"你好你好你好\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\luohongyu\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\CryptoMessageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CryptoMessageMapper.insertCryptoMessage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crypto_message          ( title,             content,                          source_url,             sentiment,             impact_level,                          collect_time,             create_time )           values ( ?,             ?,                          ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value\n; Field \'coin_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'coin_type\' doesn\'t have a default value','2025-12-16 15:17:45',13),(193,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"report\",\"className\":\"CryptoAiReport\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"报告ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MessageId\",\"columnComment\":\"关联消息ID\",\"columnId\":2,\"columnName\":\"message_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"messageId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReportDate\",\"columnComment\":\"报告日期\",\"columnId\":3,\"columnName\":\"report_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reportDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FirstAnalysis\",\"columnComment\":\"第一次分析结果（消息情感分析）\",\"columnId\":4,\"columnName\":\"first_analysis\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequir','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:19:45',148),(194,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_ai_report\"}',NULL,0,NULL,'2025-12-16 15:19:57',377),(195,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/report/index\",\"createTime\":\"2025-12-16 07:20:55\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"AI分析报告\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"report\",\"perms\":\"system:report:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:24:30',35),(196,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/report/index\",\"createTime\":\"2025-12-16 07:20:55\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"AI分析报告\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"report\",\"perms\":\"system:report:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:25:10',39),(197,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/report/index\",\"createTime\":\"2025-12-16 07:20:55\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"AI分析报告\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"report\",\"perms\":\"system:report:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:25:26',33),(198,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2066','127.0.0.1','内网IP','2066 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-16 15:42:56',29),(199,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2071','127.0.0.1','内网IP','2071 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:43:01',46),(200,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2069','127.0.0.1','内网IP','2069 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:43:03',34),(201,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2068','127.0.0.1','内网IP','2068 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:43:06',41),(202,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2067','127.0.0.1','内网IP','2067 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:43:08',61),(203,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2070','127.0.0.1','内网IP','2070 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:43:11',76),(204,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2066','127.0.0.1','内网IP','2066 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:43:14',40),(205,'数字货币消息',1,'com.ruoyi.system.controller.CryptoMessageController.add()','POST',1,'admin','研发部门','/system/message','127.0.0.1','内网IP','{\"collectTime\":\"2025-12-01\",\"createTime\":\"2025-12-16 15:47:36\",\"id\":21,\"impactLevel\":0,\"params\":{},\"title\":\"返回毫不怀疑他\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:47:36',59),(206,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":5,\"params\":{},\"percentage\":50,\"price\":666,\"snapshotDate\":\"2025-12-15\",\"usdValue\":555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:51:54',18),(207,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":5,\"params\":{},\"percentage\":50,\"price\":666,\"snapshotDate\":\"2025-12-15\",\"usdValue\":555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:52:04',1),(208,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":5,\"params\":{},\"percentage\":50,\"snapshotDate\":\"2025-12-15\",\"usdValue\":555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:52:32',1),(209,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":5,\"params\":{},\"percentage\":50,\"snapshotDate\":\"2025-12-15\",\"usdValue\":555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:52:33',1),(210,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":5,\"params\":{},\"percentage\":50,\"snapshotDate\":\"2025-12-15\",\"usdValue\":555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:52:35',1),(211,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":5,\"params\":{},\"percentage\":50,\"snapshotDate\":\"2025-12-15\",\"usdValue\":555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:52:37',1),(212,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":1111,\"params\":{},\"percentage\":2222,\"snapshotDate\":\"2025-12-28\",\"usdValue\":1111} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:53:14',6),(213,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":1000,\"changeReason\":\"每日持仓快照\",\"params\":{},\"percentage\":552222,\"price\":855,\"snapshotDate\":\"2025-12-08\",\"usdValue\":544555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:56:23',2),(214,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":1000,\"changeReason\":\"每日持仓快照\",\"params\":{},\"percentage\":552222,\"price\":855,\"snapshotDate\":\"2025-12-08\",\"usdValue\":544555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:56:27',1),(215,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":1000,\"changeReason\":\"每日持仓快照\",\"params\":{},\"percentage\":552222,\"price\":855,\"snapshotDate\":\"2025-12-08\",\"usdValue\":544555} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:56:31',1),(216,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":563,\"params\":{},\"percentage\":3583,\"price\":328,\"snapshotDate\":\"2025-12-07\",\"usdValue\":6363} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:58:30',1),(217,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":563,\"params\":{},\"percentage\":3583,\"price\":4,\"snapshotDate\":\"2025-12-07\",\"usdValue\":6363} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:58:35',1),(218,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":563,\"params\":{},\"percentage\":3583,\"price\":4,\"snapshotDate\":\"2025-12-07\",\"usdValue\":6363} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:58:39',1),(219,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":563,\"params\":{},\"percentage\":3583,\"price\":4,\"snapshotDate\":\"2025-12-07\",\"usdValue\":6363} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 15:58:42',1),(220,'审核记录',1,'com.ruoyi.system.controller.CryptoReviewLogController.add()','POST',1,'admin','研发部门','/system/log','127.0.0.1','内网IP','{\"id\":4,\"params\":{},\"reportId\":4,\"reviewResult\":\"ai\",\"reviewTime\":\"2025-12-28\",\"reviewerId\":4,\"reviewerName\":\"lhy\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 15:59:08',27),(221,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":444,\"params\":{},\"percentage\":225,\"snapshotDate\":\"2025-12-14\",\"usdValue\":8585} ',NULL,1,'coin_type cannot be null or empty','2025-12-16 16:03:34',1),(222,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2084','127.0.0.1','内网IP','2084 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-16 16:04:03',9),(223,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2089','127.0.0.1','内网IP','2089 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:08',41),(224,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2088','127.0.0.1','内网IP','2088 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:10',40),(225,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2086','127.0.0.1','内网IP','2086 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:13',32),(226,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2085','127.0.0.1','内网IP','2085 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:15',35),(227,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2087','127.0.0.1','内网IP','2087 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:17',31),(228,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2084','127.0.0.1','内网IP','2084 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:20',35),(229,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2083','127.0.0.1','内网IP','2083 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:25',39),(230,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2082','127.0.0.1','内网IP','2082 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:28',31),(231,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2080','127.0.0.1','内网IP','2080 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:30',33),(232,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2079','127.0.0.1','内网IP','2079 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:33',32),(233,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2081','127.0.0.1','内网IP','2081 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:36',40),(234,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2078','127.0.0.1','内网IP','2078 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:04:38',34),(235,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"position\",\"className\":\"CryptoPosition\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"持仓ID\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 19:04:16\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型\",\"columnId\":44,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 19:04:16\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"持仓数量\",\"columnId\":45,\"columnName\":\"amount\",\"columnType\":\"decimal(20,8)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"amount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 19:04:16\",\"usableColumn\":false},{\"capJavaField\":\"Percentage\",\"columnComment\":\"持仓占比（百分比）\",\"columnId\":46,\"columnName\":\"percentage\",\"columnType\":\"decimal(5,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:05:02',225),(236,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"position\",\"className\":\"CryptoPosition\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"持仓ID\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-12-16 16:05:02\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型\",\"columnId\":44,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-12-16 16:05:02\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"持仓数量\",\"columnId\":45,\"columnName\":\"amount\",\"columnType\":\"decimal(20,8)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"amount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-12-16 16:05:02\",\"usableColumn\":false},{\"capJavaField\":\"Percentage\",\"columnComment\":\"持仓占比（百分比）\",\"columnId\":46,\"columnName\":\"percentage\",\"columnType\":\"decimal(5,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:05:53',111),(237,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_position\"}',NULL,0,NULL,'2025-12-16 16:05:59',772),(238,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":77,\"coinType\":\"ADA\",\"createTime\":\"2025-12-16 16:11:31\",\"id\":9,\"params\":{},\"percentage\":363,\"price\":393,\"snapshotDate\":\"2025-12-07\",\"usdValue\":39} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:11:31',26),(239,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2091','127.0.0.1','内网IP','2091 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:11:45',55),(240,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2092','127.0.0.1','内网IP','2092 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:11:47',36),(241,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2093','127.0.0.1','内网IP','2093 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:11:50',38),(242,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2094','127.0.0.1','内网IP','2094 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:11:52',32),(243,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2095','127.0.0.1','内网IP','2095 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:11:55',29),(244,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2090','127.0.0.1','内网IP','2090 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:11:58',38),(245,'持仓数据',3,'com.ruoyi.system.controller.CryptoPositionController.remove()','DELETE',1,'admin','研发部门','/system/position/9','127.0.0.1','内网IP','[9] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:12:06',26),(246,'持仓数据',1,'com.ruoyi.system.controller.CryptoPositionController.add()','POST',1,'admin','研发部门','/system/position','127.0.0.1','内网IP','{\"amount\":44,\"coinType\":\"ADA\",\"createTime\":\"2025-12-16 16:12:19\",\"id\":10,\"params\":{},\"percentage\":553,\"price\":569,\"snapshotDate\":\"2025-12-07\",\"usdValue\":8598} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:12:19',28),(247,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"history\",\"className\":\"CryptoPositionHistory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"历史记录ID\",\"columnId\":52,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 20:58:33\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型\",\"columnId\":53,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 20:58:33\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"持仓数量\",\"columnId\":54,\"columnName\":\"amount\",\"columnType\":\"decimal(20,8)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"amount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-15 20:58:33\",\"usableColumn\":false},{\"capJavaField\":\"Percentage\",\"columnComment\":\"持仓占比\",\"columnId\":55,\"columnName\":\"percentage\",\"columnType\":\"decimal(5,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:12:39',105),(248,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"history\",\"className\":\"CryptoPositionHistory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"历史记录ID\",\"columnId\":52,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-16 16:12:39\",\"usableColumn\":false},{\"capJavaField\":\"CoinType\",\"columnComment\":\"数字货币类型\",\"columnId\":53,\"columnName\":\"coin_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coinType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-16 16:12:39\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"持仓数量\",\"columnId\":54,\"columnName\":\"amount\",\"columnType\":\"decimal(20,8)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"amount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-12-16 16:12:39\",\"usableColumn\":false},{\"capJavaField\":\"Percentage\",\"columnComment\":\"持仓占比\",\"columnId\":55,\"columnName\":\"percentage\",\"columnType\":\"decimal(5,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-15 13:56:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:12:54',110),(249,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_position_history\"}',NULL,0,NULL,'2025-12-16 16:12:58',361),(250,'持仓历史记录',1,'com.ruoyi.system.controller.CryptoPositionHistoryController.add()','POST',1,'admin','研发部门','/system/history','127.0.0.1','内网IP','{\"amount\":4444,\"coinType\":\"BTC\",\"createTime\":\"2025-12-16 16:17:59\",\"id\":18,\"params\":{},\"percentage\":265,\"snapshotDate\":\"2025-10-07\",\"usdValue\":263} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:17:59',24),(251,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2101','127.0.0.1','内网IP','2101 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:18:21',43),(252,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2100','127.0.0.1','内网IP','2100 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:18:24',119),(253,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2098','127.0.0.1','内网IP','2098 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:18:27',32),(254,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2097','127.0.0.1','内网IP','2097 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:18:30',131),(255,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2099','127.0.0.1','内网IP','2099 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:18:32',128),(256,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2096','127.0.0.1','内网IP','2096 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:18:36',215),(257,'AI分析报告',1,'com.ruoyi.system.controller.CryptoAiReportController.add()','POST',1,'admin','研发部门','/system/report','127.0.0.1','内网IP','{\"createTime\":\"2025-12-16 16:19:11\",\"id\":6,\"params\":{},\"reportDate\":\"2025-12-01\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 16:19:11',39),(258,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-12-15 05:48:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2036,2037,2038,2039,2040,2041,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2072,2073,2074,2075,2076,2077,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2060,2061,2062,2063,2064,2065,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 17:33:25',233),(259,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'ry','测试部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"lhy\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 22:38:16',68),(260,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"管理员\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-16 22:39:31',51),(261,'持仓数据',5,'com.ruoyi.system.controller.CryptoPositionController.export()','POST',1,'admin','研发部门','/system/position/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2025-12-16 22:47:52',2120),(262,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"crypto_collect_log\"}',NULL,0,NULL,'2025-12-19 22:38:40',378),(263,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/log/index\",\"createTime\":\"2025-12-19 22:44:49\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2102,\"menuName\":\"消息采集任务日志\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"system:log:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:00:06',64),(264,'审核记录',2,'com.ruoyi.system.controller.CryptoReviewLogController.edit()','PUT',1,'admin','研发部门','/system/log','127.0.0.1','内网IP','{\"id\":1,\"params\":{},\"reportId\":2,\"reviewComment\":\"同意AI建议，保持现有持仓结构\",\"reviewResult\":\"APPROVED\",\"reviewTime\":\"2025-12-14\",\"reviewerId\":1,\"reviewerName\":\"管理员\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:07:36',39),(265,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2113','127.0.0.1','内网IP','2113 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:16:13',60),(266,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2112','127.0.0.1','内网IP','2112 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:16:15',41),(267,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2111','127.0.0.1','内网IP','2111 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:16:18',57),(268,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2109','127.0.0.1','内网IP','2109 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:16:20',42),(269,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2108','127.0.0.1','内网IP','2108 ','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-12-19 23:16:23',9),(270,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2110','127.0.0.1','内网IP','2110 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:16:25',62),(271,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2108','127.0.0.1','内网IP','2108 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:16:28',37),(272,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-12-15 05:48:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2036,2037,2038,2039,2040,2041,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2072,2073,2074,2075,2076,2077,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2060,2061,2062,2063,2064,2065,2102,2103,2104,2105,2106,2107,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:17:01',186),(273,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-12-15 05:48:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2036,2037,2038,2039,2040,2041,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2072,2073,2074,2075,2076,2077,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2060,2061,2062,2063,2064,2065,2102,2103,2104,2105,2106,2107],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-19 23:17:59',63);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2025-12-15 05:48:45','',NULL,''),(2,'se','项目经理',2,'0','admin','2025-12-15 05:48:45','',NULL,''),(3,'hr','人力资源',3,'0','admin','2025-12-15 05:48:45','',NULL,''),(4,'user','普通员工',4,'0','admin','2025-12-15 05:48:45','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-12-15 05:48:45','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-12-15 05:48:45','admin','2025-12-19 23:17:59','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2000),(2,2001),(2,2002),(2,2003),(2,2004),(2,2005),(2,2006),(2,2007),(2,2008),(2,2009),(2,2010),(2,2011),(2,2012),(2,2013),(2,2014),(2,2015),(2,2016),(2,2017),(2,2024),(2,2025),(2,2026),(2,2027),(2,2028),(2,2029),(2,2030),(2,2031),(2,2032),(2,2033),(2,2034),(2,2035),(2,2036),(2,2037),(2,2038),(2,2039),(2,2040),(2,2041),(2,2048),(2,2049),(2,2050),(2,2051),(2,2052),(2,2053),(2,2054),(2,2055),(2,2056),(2,2057),(2,2058),(2,2059),(2,2060),(2,2061),(2,2062),(2,2063),(2,2064),(2,2065),(2,2072),(2,2073),(2,2074),(2,2075),(2,2076),(2,2077),(2,2102),(2,2103),(2,2104),(2,2105),(2,2106),(2,2107);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','管理员','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-12-19 23:17:38','2025-12-15 05:48:45','admin','2025-12-15 05:48:45','','2025-12-16 22:39:31','管理员'),(2,105,'ry','lhy','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-12-19 23:17:15','2025-12-15 05:48:45','admin','2025-12-15 05:48:45','','2025-12-16 22:38:16','测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'investment'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-20 19:24:41
