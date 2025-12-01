// 加密货币数据服务层
// 封装所有API调用方法，提供类型安全的接口

import { CryptoMessage, CryptoPosition, CryptoPositionHistory, CryptoAIReport, CryptoReviewLog, CryptoCollectLog, ReportWithRelations, ReviewProcessData, MessageProcessData } from '../types/crypto/database';
import { MessageItem, MessageListResponse } from '../types/crypto/message';
import { PositionItem } from '../types/crypto/position';
import { ReportDetail, ReportListResponse } from '../types/crypto/report';
import { OverviewData } from '../types/crypto/overview';

// 通用响应接口
interface ApiResponse<T> {
  success: boolean;
  data: T;
  message?: string;
  total?: number;
}

// 基础API服务类
class BaseApiService {
  private baseUrl = '/api/crypto';

  // 通用GET请求方法
  async get<T>(endpoint: string, params?: Record<string, any>): Promise<ApiResponse<T>> {
    const queryString = params ? '?' + new URLSearchParams(params).toString() : '';
    const url = `${this.baseUrl}${endpoint}${queryString}`;
    
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`API请求失败: ${response.status}`);
      }
      return await response.json();
    } catch (error) {
      console.error(`GET请求失败 ${url}:`, error);
      throw error;
    }
  }

  // 通用POST请求方法
  async post<T>(endpoint: string, data?: any): Promise<ApiResponse<T>> {
    const url = `${this.baseUrl}${endpoint}`;
    
    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: data ? JSON.stringify(data) : undefined,
      });
      
      if (!response.ok) {
        throw new Error(`API请求失败: ${response.status}`);
      }
      
      return await response.json();
    } catch (error) {
      console.error(`POST请求失败 ${url}:`, error);
      throw error;
    }
  }

  // 通用PUT请求方法
  async put<T>(endpoint: string, data?: any): Promise<ApiResponse<T>> {
    const url = `${this.baseUrl}${endpoint}`;
    
    try {
      const response = await fetch(url, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: data ? JSON.stringify(data) : undefined,
      });
      
      if (!response.ok) {
        throw new Error(`API请求失败: ${response.status}`);
      }
      
      return await response.json();
    } catch (error) {
      console.error(`PUT请求失败 ${url}:`, error);
      throw error;
    }
  }

  // 通用DELETE请求方法
  async delete<T>(endpoint: string): Promise<ApiResponse<T>> {
    const url = `${this.baseUrl}${endpoint}`;
    
    try {
      const response = await fetch(url, {
        method: 'DELETE',
      });
      
      if (!response.ok) {
        throw new Error(`API请求失败: ${response.status}`);
      }
      
      return await response.json();
    } catch (error) {
      console.error(`DELETE请求失败 ${url}:`, error);
      throw error;
    }
  }
}

// 市场概览服务
class OverviewService extends BaseApiService {
  // 获取市场概览数据
  async getOverview(): Promise<OverviewData> {
    const response = await this.get<OverviewData>('/overview');
    return response.data;
  }

  // 获取实时市场数据
  async getMarketData(): Promise<any> {
    const response = await this.get<any>('/market/data');
    return response.data;
  }

  // 获取投资组合分析
  async getPortfolioAnalysis(): Promise<any> {
    const response = await this.get<any>('/portfolio/analysis');
    return response.data;
  }
}

// 持仓管理服务
class PositionService extends BaseApiService {
  // 获取所有持仓
  async getPositions(): Promise<PositionItem[]> {
    const response = await this.get<PositionItem[]>('/positions');
    return response.data;
  }

  // 获取持仓详情
  async getPositionDetail(symbol: string): Promise<PositionItem> {
    const response = await this.get<PositionItem>(`/positions/${symbol}`);
    return response.data;
  }

  // 获取持仓历史记录
  async getPositionHistory(params?: {
    coinType?: string;
    startDate?: string;
    endDate?: string;
    limit?: number;
  }): Promise<{
    data: CryptoPositionHistory[];
    total: number;
  }> {
    const response = await this.get<{
      data: CryptoPositionHistory[];
      total: number;
    }>('/positions/history', params);
    return response.data;
  }

  // 获取特定币种的持仓历史记录
  async getPositionHistoryBySymbol(
    symbol: string,
    params?: {
      startDate?: string;
      endDate?: string;
      limit?: number;
    }
  ): Promise<{
    data: CryptoPositionHistory[];
    total: number;
    coinType: string;
  }> {
    const response = await this.get<{
      data: CryptoPositionHistory[];
      total: number;
      coinType: string;
    }>(`/positions/${symbol}/history`, params);
    return response.data;
  }

  // 获取交易记录
  async getTransactions(params?: {
    coinType?: string;
    startDate?: string;
    endDate?: string;
    type?: string;
  }): Promise<any[]> {
    const response = await this.get<any[]>('/transactions', params);
    return response.data;
  }

  // 获取盈亏分析
  async getProfitLossAnalysis(): Promise<any> {
    const response = await this.get<any>('/profit-loss/analysis');
    return response.data;
  }
}

// 市场消息服务
class MessageService extends BaseApiService {
  // 获取市场消息列表
  async getMessages(params?: {
    coinType?: string;
    sentiment?: string;
    impactLevel?: number;
    startDate?: string;
    endDate?: string;
    page?: number;
    pageSize?: number;
  }): Promise<MessageListResponse> {
    const response = await this.get<MessageListResponse>('/messages', params);
    return response.data;
  }

  // 获取消息详情
  async getMessageDetail(id: string): Promise<MessageItem> {
    const response = await this.get<MessageItem>(`/messages/${id}`);
    return response.data;
  }

  // 获取实时消息流
  async getRealtimeMessageStream(): Promise<any[]> {
    const response = await this.get<any[]>('/messages/realtime');
    return response.data;
  }

  // 获取消息处理流程数据
  async getMessageProcessData(messageId: string): Promise<MessageProcessData> {
    const response = await this.get<MessageProcessData>(`/messages/process/${messageId}`);
    return response.data;
  }

  // 数据库级别的消息查询
  async getMessagesFromDb(params?: {
    messageId?: string;
    coinType?: string;
    sentiment?: string;
    status?: number;
    startDate?: string;
    endDate?: string;
  }): Promise<CryptoMessage[]> {
    const response = await this.get<CryptoMessage[]>('/messages/db', params);
    return response.data;
  }
}

// AI报告服务
class ReportService extends BaseApiService {
  // 获取报告列表
  async getReports(params?: {
    reportType?: string;
    recommendType?: string;
    marketTrend?: string;
    page?: number;
    pageSize?: number;
  }): Promise<ReportListResponse> {
    const response = await this.get<ReportListResponse>('/reports', params);
    return response.data;
  }

  // 获取报告详情
  async getReportDetail(id: string): Promise<ReportDetail> {
    const response = await this.get<ReportDetail>(`/reports/${id}`);
    return response.data;
  }

  // 获取数据库级别的报告数据
  async getReportsFromDb(params?: {
    reportId?: string;
    messageId?: string;
    reportStatus?: string;
    startDate?: string;
    endDate?: string;
  }): Promise<CryptoAIReport[]> {
    const response = await this.get<CryptoAIReport[]>('/reports/db', params);
    return response.data;
  }

  // 获取报告详情带关联数据
  async getReportWithRelations(id: string): Promise<ReportWithRelations> {
    const response = await this.get<ReportWithRelations>(`/reports/db/${id}`);
    return response.data;
  }

  // 获取审核流程完整数据
  async getReviewProcessData(reportId: string): Promise<ReviewProcessData> {
    const response = await this.get<ReviewProcessData>(`/reviews/process/${reportId}`);
    return response.data;
  }
}

// 审核日志服务
class ReviewService extends BaseApiService {
  // 获取审核日志
  async getReviewLogs(params?: {
    reportId?: string;
    reviewerId?: number;
    reviewResult?: string;
    startDate?: string;
    endDate?: string;
  }): Promise<{
    data: CryptoReviewLog[];
    total: number;
  }> {
    const response = await this.get<{
      data: CryptoReviewLog[];
      total: number;
    }>('/reviews/logs', params);
    return response.data;
  }

  // 提交审核结果
  async submitReview(reportId: string, data: {
    reviewerId: number;
    reviewerName: string;
    reviewResult: 'APPROVED' | 'REJECTED';
    reviewComment?: string;
  }): Promise<{
    success: boolean;
    message: string;
  }> {
    const response = await this.post<{
      success: boolean;
      message: string;
    }>(`/reviews/submit/${reportId}`, data);
    return response;
  }
}

// 消息采集日志服务
class CollectLogService extends BaseApiService {
  // 获取采集日志
  async getCollectLogs(params?: {
    taskDate?: string;
    collectStatus?: string;
    startDate?: string;
    endDate?: string;
  }): Promise<{
    data: CryptoCollectLog[];
    total: number;
  }> {
    const response = await this.get<{
      data: CryptoCollectLog[];
      total: number;
    }>('/collect/logs', params);
    return response.data;
  }

  // 获取采集统计信息
  async getCollectStatistics(): Promise<any> {
    const response = await this.get<any>('/collect/statistics');
    return response.data;
  }
}

// 综合统计服务
class StatisticsService extends BaseApiService {
  // 获取整体统计概览
  async getOverviewStatistics(): Promise<any> {
    const response = await this.get<any>('/stats/overview');
    return response.data;
  }

  // 获取报告状态统计
  async getReportStatusStatistics(): Promise<any> {
    const response = await this.get<any>('/stats/reports');
    return response.data;
  }

  // 获取消息情感统计
  async getMessageSentimentStatistics(): Promise<any> {
    const response = await this.get<any>('/stats/messages/sentiment');
    return response.data;
  }
}

// 完整的加密货币数据服务实例
const cryptoService = {
  overview: new OverviewService(),
  position: new PositionService(),
  message: new MessageService(),
  report: new ReportService(),
  review: new ReviewService(),
  collectLog: new CollectLogService(),
  statistics: new StatisticsService(),
  
  // 便捷方法：获取所有服务
  getAllServices: () => ({
    overview: new OverviewService(),
    position: new PositionService(),
    message: new MessageService(),
    report: new ReportService(),
    review: new ReviewService(),
    collectLog: new CollectLogService(),
    statistics: new StatisticsService(),
  }),
};

export default cryptoService;

// 导出类型定义，方便在组件中使用
export type {
  ApiResponse,
  OverviewService,
  PositionService,
  MessageService,
  ReportService,
  ReviewService,
  CollectLogService,
  StatisticsService,
};