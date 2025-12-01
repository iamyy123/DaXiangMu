// 数据库表映射的类型定义文件
// 基于数据库脚本创建的完整类型定义

// 1. 数字货币消息表 (crypto_message)
export interface CryptoMessage {
  id: string;
  coinType: string;
  title: string;
  content: string;
  source: string;
  sourceUrl?: string;
  sentiment: 'positive' | 'negative' | 'neutral'; // 利好/利空/中性
  impactLevel: number; // 影响等级 (1-5分)
  analysisResult?: string; // AI第一次分析结果
  collectTime: string; // 采集时间
  status: number; // 状态 (0-未处理/1-已处理)
}

// 2. 当前持仓表 (crypto_position)
export interface CryptoPosition {
  id: string;
  coinType: string;
  amount: number;
  percentage: number; // 占总资产比例(%)
  usdValue: number; // 美元价值
  price: number; // 当前单价(美元)
  snapshotDate: string; // 快照日期
  updateTime: string; // 更新时间
}

// 3. 持仓历史表 (crypto_position_history)
export interface CryptoPositionHistory {
  id: string;
  coinType: string;
  amount: number;
  percentage: number;
  usdValue: number;
  price: number;
  changeType: string; // 变动类型
  changeReason?: string; // 变动原因
  snapshotDate: string; // 快照日期
  createTime: string; // 创建时间
}

// 4. AI分析报告表 (crypto_ai_report)
export interface CryptoAIReport {
  id: string;
  messageId: string; // 关联消息ID
  reportDate: string; // 报告日期
  firstAnalysis: string; // AI第一次分析结果
  positionSnapshot: string; // 持仓快照(JSON格式)
  secondAnalysis: string; // AI第二次分析结果
  adjustmentSuggestion: string; // 调整建议(JSON格式)
  analysisBasis?: string; // 分析依据
  reportStatus: 'PENDING' | 'APPROVED' | 'REJECTED'; // 报告状态
  createTime: string; // 创建时间
  updateTime: string; // 更新时间
}

// 5. 审核日志表 (crypto_review_log)
export interface CryptoReviewLog {
  id: string;
  reportId: string; // 关联报告ID
  reviewerId: number;
  reviewerName: string;
  reviewResult: 'APPROVED' | 'REJECTED'; // 审核结果
  reviewComment?: string; // 审核意见
  reviewTime: string; // 审核时间
}

// 6. 消息采集日志表 (crypto_collect_log)
export interface CryptoCollectLog {
  id: string;
  taskDate: string; // 任务日期
  collectStatus: 'SUCCESS' | 'FAILED'; // 采集状态
  messageCount: number; // 采集到的消息数量
  retryCount: number; // 重试次数
  executeTime: string; // 执行时间
  duration?: number; // 执行耗时(毫秒)
  errorMsg?: string; // 错误信息
}

// 扩展现有类型，添加数据库相关字段

import { MessageItem } from './message';
import { PositionItem, PositionHistoryItem } from './position';
import { ReportDetail } from './report';

// 数据库扩展的消息类型
export interface MessageItemWithDB extends MessageItem {
  dbData: {
    message: CryptoMessage;
    collectLog?: CryptoCollectLog;
  };
}

// 数据库扩展的持仓类型
export interface PositionItemWithDB extends PositionItem {
  dbData: {
    position: CryptoPosition;
    historyCount: number;
  };
}

// 数据库扩展的持仓历史类型
export interface PositionHistoryItemWithDB extends PositionHistoryItem {
  dbData: {
    history: CryptoPositionHistory;
  };
}

// 数据库扩展的报告类型
export interface ReportDetailWithDB extends ReportDetail {
  dbData: {
    report: CryptoAIReport;
    associatedMessage?: CryptoMessage;
    reviewLogs?: CryptoReviewLog[];
  };
}

// 数据关联查询接口
export interface ReportWithRelations extends CryptoAIReport {
  message: CryptoMessage;
  reviewLogs: CryptoReviewLog[];
}

// 完整的审核流程数据
export interface ReviewProcessData {
  report: CryptoAIReport;
  message: CryptoMessage;
  reviewLogs: CryptoReviewLog[];
  positionSnapshot: CryptoPosition[];
}

// 完整的消息处理流程数据
export interface MessageProcessData {
  message: CryptoMessage;
  collectLog: CryptoCollectLog;
  reports?: CryptoAIReport[];
}

// 持仓完整历史记录
export interface PositionCompleteHistory {
  current: CryptoPosition;
  history: CryptoPositionHistory[];
  changes: {
    date: string;
    changePercentage: number;
    valueChange: number;
    reason?: string;
  }[];
}
