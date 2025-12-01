// 持仓资产详细信息
export interface PositionItem {
  id: string;
  symbol: string;
  coinName: string;
  currentPrice: number;
  holdingAmount: number;
  totalValue: number;
  profitLoss: number;
  profitLossRate: number;
  entryPrice: number;
  marketValue: number;
  change24h: number;
  change24hRate: number;
  change7d: number;
  change7dRate: number;
  change30d: number;
  change30dRate: number;
  riskLevel: 'low' | 'medium' | 'high';
  sector: string;
  assetType: 'crypto' | 'token' | 'stablecoin';
  liquidityScore: number;
  volatilityScore: number;
  aiAnalysis: {
    shortTermOutlook: 'bearish' | 'neutral' | 'bullish';
    confidenceScore: number;
    keyFactors: string[];
    recommendation: string;
  };
  lastUpdated: string;
}

// 持仓交易记录
export interface TransactionRecord {
  id: string;
  symbol: string;
  type: 'buy' | 'sell';
  quantity: number;
  price: number;
  totalValue: number;
  transactionFee: number;
  timestamp: string;
  status: 'completed' | 'pending' | 'failed';
  exchange: string;
  orderId?: string;
}

// 持仓历史记录项类型定义
export interface PositionHistoryItem {
  id: string;
  symbol: string;
  coinName: string;
  date: string;
  closingPrice: number;
  holdingAmount: number;
  totalValue: number;
  dailyChange: number;
  dailyChangeRate: number;
  cumulativeProfitLoss: number;
  cumulativeProfitLossRate: number;
  marketCap: number;
  tradingVolume: number;
}

// 盈亏分析数据
export interface ProfitLossAnalysis {
  summary: {
    totalProfitLoss: number;
    totalProfitLossRate: number;
    realizedProfitLoss: number;
    unrealizedProfitLoss: number;
    profitTradesCount: number;
    lossTradesCount: number;
    winRate: number;
    averageProfitPerWin: number;
    averageLossPerLoss: number;
    profitFactor: number;
  };
  byAsset: Array<{
    symbol: string;
    realizedProfitLoss: number;
    unrealizedProfitLoss: number;
    totalProfitLoss: number;
    profitLossRate: number;
    winRate: number;
  }>;
  byTimePeriod: Array<{
    period: string;
    startDate: string;
    endDate: string;
    profitLoss: number;
    profitLossRate: number;
    transactionCount: number;
  }>;
  bySector: Array<{
    sector: string;
    profitLoss: number;
    profitLossRate: number;
    allocationPercentage: number;
  }>;
}

// 风险分析数据
export interface PositionRiskAnalysis {
  overallRiskScore: number;
  riskDistribution: {
    low: number;
    medium: number;
    high: number;
  };
  concentrationRisk: {
    top3AssetsPercentage: number;
    topSectorPercentage: number;
    maxSingleAssetExposure: number;
  };
  volatilityAnalysis: {
    averageVolatility: number;
    maxVolatilityAsset: string;
    volatilityRiskLevel: 'low' | 'medium' | 'high';
  };
  sectorRisk: Array<{
    sector: string;
    riskLevel: 'low' | 'medium' | 'high';
    exposurePercentage: number;
    riskFactors: string[];
  }>;
  correlationAnalysis: Array<{
    asset1: string;
    asset2: string;
    correlationCoefficient: number;
    correlationRisk: 'low' | 'medium' | 'high';
  }>;
  recommendations: string[];
}

// 当前持仓响应类型
export interface CurrentPositionResponse {
  data: PositionItem[];
  summary: {
    totalValue: number;
    totalCost: number;
    totalProfitLoss: number;
    totalProfitLossRate: number;
    holdingCount: number;
    sectorCount: number;
    averageReturn: number;
    weightedRiskScore: number;
  };
  sectorAllocation: Array<{
    sector: string;
    value: number;
    percentage: number;
    profitLoss: number;
    profitLossRate: number;
  }>;
}

// 持仓历史响应类型
export interface PositionHistoryResponse {
  data: PositionHistoryItem[];
  summary: {
    timeRange: string;
    startDate: string;
    endDate: string;
    averageValue: number;
    maxValue: number;
    minValue: number;
    totalReturn: number;
    totalReturnRate: number;
  };
  pagination: {
    current: number;
    pageSize: number;
    total: number;
  };
}

// 持仓列表响应类型
export interface PositionListResponse {
  data: PositionItem[];
  pagination: {
    current: number;
    pageSize: number;
    total: number;
  };
  filterSummary: {
    totalValue: number;
    totalProfitLoss: number;
    totalProfitLossRate: number;
  };
}