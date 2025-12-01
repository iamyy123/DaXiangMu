import { request } from '@umijs/max';
import type { 
  PositionItem, 
  PositionHistoryItem, 
  CurrentPositionResponse, 
  PositionHistoryResponse,
  TransactionRecord,
  ProfitLossAnalysis,
  PositionRiskAnalysis,
  PositionListResponse
} from '@/types/crypto/position';

/**
 * 查询当前持仓（AI专用接口）
 */
export async function getCurrentPosition() {
  return request<{ 
    data: CurrentPositionResponse; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/position/current', {
    method: 'GET',
  });
}

/**
 * 查询持仓列表
 * @param params 查询参数
 */
export async function getPositionList(params: {
  page?: number;
  pageSize?: number;
  symbol?: string;
  riskLevel?: 'low' | 'medium' | 'high';
  sector?: string;
  assetType?: 'crypto' | 'token' | 'stablecoin';
  sortBy?: string;
  sortOrder?: 'asc' | 'desc';
  minValue?: number;
  maxValue?: number;
}) {
  return request<{ 
    data: PositionListResponse; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/position/list', {
    method: 'GET',
    params,
  });
}

/**
 * 查询持仓历史记录
 * @param params 查询参数
 */
export async function getPositionHistory(params: { 
  page?: number;
  pageSize?: number;
  days?: number;
  symbol?: string;
  startDate?: string;
  endDate?: string;
  timeRange?: '1d' | '7d' | '30d' | '90d' | '1y' | 'all';
}) {
  return request<{ 
    data: PositionHistoryResponse; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/position/history', {
    method: 'GET',
    params,
  });
}

/**
 * 获取持仓盈亏分析
 * @param params 查询参数
 */
export async function getProfitLossAnalysis(params?: {
  startDate?: string;
  endDate?: string;
  includeByAsset?: boolean;
  includeByTimePeriod?: boolean;
  includeBySector?: boolean;
  symbol?: string;
}) {
  return request<{ 
    data: ProfitLossAnalysis; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/position/profit-loss', {
    method: 'GET',
    params,
  });
}

/**
 * 获取持仓风险分析
 * @param params 查询参数
 */
export async function getPositionRiskAnalysis(params?: {
  includeCorrelation?: boolean;
  includeSectorRisk?: boolean;
}) {
  return request<{ 
    data: PositionRiskAnalysis; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/position/risk-analysis', {
    method: 'GET',
    params,
  });
}

/**
 * 获取交易记录
 * @param params 查询参数
 */
export async function getTransactionHistory(params?: {
  page?: number;
  pageSize?: number;
  symbol?: string;
  type?: 'buy' | 'sell';
  startDate?: string;
  endDate?: string;
  status?: 'completed' | 'pending' | 'failed';
}) {
  return request<{ 
    data: {
      list: TransactionRecord[];
      pagination: {
        current: number;
        pageSize: number;
        total: number;
      };
    }; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/position/transactions', {
    method: 'GET',
    params,
  });
}

/**
 * 导出持仓数据
 * @param params 导出参数
 */
export async function exportPosition(params?: {
  format?: 'csv' | 'excel' | 'pdf';
  includeHeaders?: boolean;
  symbol?: string;
}) {
  return request<Blob>('/api/crypto/position/export', {
    method: 'POST',
    responseType: 'blob',
    params,
  });
}

/**
 * 获取特定资产详情
 * @param symbol 资产符号
 */
export async function getAssetDetail(symbol: string) {
  return request<{ 
    data: PositionItem; 
    success: boolean; 
    message?: string 
  }>(`/api/crypto/position/asset/${symbol}`, {
    method: 'GET',
  });
}

