import { request } from '@umijs/max';
import type { 
  ReportItem, 
  ReportDetail, 
  ReportListResponse, 
  ReportDetailResponse,
  ReportFrequency,
  RecommendationLevel,
  MarketTrend,
  RiskLevel,
  TechnicalIndicatorAnalysis,
  InvestmentRecommendation
} from '@/types/crypto/report';

/**
 * 获取AI报告列表
 * @param params 查询参数
 */
export async function getReportList(params?: {
  page?: number;
  pageSize?: number;
  reportType?: ReportFrequency;
  status?: 'draft' | 'pending' | 'approved' | 'rejected';
  keyword?: string;
  startTime?: string;
  endTime?: string;
  recommendation?: RecommendationLevel;
  marketTrend?: MarketTrend;
  riskLevel?: RiskLevel;
  sortBy?: 'publishDate' | 'viewCount' | 'recommendation';
  sortOrder?: 'asc' | 'desc';
  tags?: string[];
}) {
  return request<{
    data: ReportListResponse;
    success: boolean;
    message?: string;
  }>('/api/crypto/ai/report/list', {
    method: 'GET',
    params,
  });
}

/**
 * 获取报告详情
 * @param id 报告ID
 */
export async function getReportDetail(id: string) {
  return request<{
    data: ReportDetailResponse;
    success: boolean;
    message?: string;
  }>(`/api/crypto/ai/report/${id}`, {
    method: 'GET',
  });
}

/**
 * 获取技术指标分析
 * @param reportId 报告ID
 */
export async function getTechnicalIndicators(reportId: string) {
  return request<{
    data: TechnicalIndicatorAnalysis[];
    success: boolean;
    message?: string;
  }>(`/api/crypto/ai/report/${reportId}/technical-indicators`, {
    method: 'GET',
  });
}

/**
 * 获取投资建议
 * @param reportId 报告ID
 */
export async function getInvestmentRecommendations(reportId: string) {
  return request<{
    data: InvestmentRecommendation[];
    success: boolean;
    message?: string;
  }>(`/api/crypto/ai/report/${reportId}/recommendations`, {
    method: 'GET',
  });
}

/**
 * 获取定期报告摘要
 * @param type 报告类型
 * @param count 数量限制
 */
export async function getPeriodicReportSummaries(type: ReportFrequency, count?: number) {
  return request<{
    data: ReportItem[];
    success: boolean;
    message?: string;
  }>('/api/crypto/ai/report/periodic/summaries', {
    method: 'GET',
    params: { type, count },
  });
}

/**
 * 审核通过报告
 * @param reportId 报告ID
 */
export async function approveReport(reportId: string) {
  return request<{
    success: boolean;
    message?: string;
  }>('/api/crypto/review/approve', {
    method: 'POST',
    data: { reportId },
  });
}

/**
 * 审核驳回报告
 * @param reportId 报告ID
 * @param rejectReason 驳回原因
 */
export async function rejectReport(reportId: string, rejectReason: string) {
  return request<{
    success: boolean;
    message?: string;
  }>('/api/crypto/review/reject', {
    method: 'POST',
    data: { reportId, rejectReason },
  });
}

/**
 * 获取报告统计数据
 */
export async function getReportStatistics() {
  return request<{
    data: ReportListResponse['statistics'];
    success: boolean;
    message?: string;
  }>('/api/crypto/ai/report/statistics', {
    method: 'GET',
  });
}

/**
 * 获取相关报告推荐
 * @param reportId 报告ID
 * @param limit 数量限制
 */
export async function getRelatedReports(reportId: string, limit?: number) {
  return request<{
    data: ReportListResponse['data'];
    success: boolean;
    message?: string;
  }>(`/api/crypto/ai/report/${reportId}/related`, {
    method: 'GET',
    params: { limit },
  });
}

/**
 * 获取最新市场洞察报告
 */
export async function getLatestMarketInsights() {
  return request<{
    data: ReportItem[];
    success: boolean;
    message?: string;
  }>('/api/crypto/ai/report/latest/insights', {
    method: 'GET',
  });
}

