import { request } from '@umijs/max';
import type { 
  CryptoOverview, 
  RealTimeMarketData, 
  PortfolioAnalysis,
  AIInsights
} from '@/types/crypto/overview';

/**
 * 获取完整的系统概览数据
 */
export async function getOverview() {
  return request<{ 
    data: CryptoOverview; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/overview', {
    method: 'GET',
  });
}

/**
 * 获取实时市场数据
 * @param params 查询参数
 */
export async function getRealTimeMarketData(params?: {
  limit?: number;
  includeSectors?: boolean;
  includeHeatmap?: boolean;
}) {
  return request<{ 
    data: RealTimeMarketData; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/market-data', {
    method: 'GET',
    params,
  });
}

/**
 * 获取投资组合分析数据
 * @param params 查询参数
 */
export async function getPortfolioAnalysis(params?: {
  timeRange?: '1d' | '1w' | '1m' | '3m' | '6m' | '1y' | 'all';
  includeRiskMetrics?: boolean;
  includeBenchmark?: boolean;
  benchmarkSymbol?: string;
}) {
  return request<{ 
    data: PortfolioAnalysis; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/portfolio/analysis', {
    method: 'GET',
    params,
  });
}

/**
 * 获取AI洞察数据
 * @param params 查询参数
 */
export async function getAIInsights(params?: {
  categories?: ('trend' | 'risk' | 'opportunity' | 'recommendation')[];
  limit?: number;
  minConfidence?: number;
  relatedSymbols?: string[];
}) {
  return request<{ 
    data: AIInsights; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/ai/insights', {
    method: 'GET',
    params,
  });
}

/**
 * 获取市场风险评估
 */
export async function getRiskAssessment() {
  return request<{ 
    data: CryptoOverview['riskAssessment']; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/risk/assessment', {
    method: 'GET',
  });
}

/**
 * 获取最近活动记录
 * @param params 查询参数
 */
export async function getRecentActivities(params?: {
  limit?: number;
  types?: ('buy' | 'sell' | 'report' | 'message' | 'alert')[];
  startTime?: string;
  endTime?: string;
}) {
  return request<{ 
    data: CryptoOverview['recentActivities']; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/activities', {
    method: 'GET',
    params,
  });
}

/**
 * 刷新市场数据
 */
export async function refreshMarketData() {
  return request<{ 
    data: { 
      refreshedAt: string; 
      updatedItems: number 
    }; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/market-data/refresh', {
    method: 'POST',
  });
}

