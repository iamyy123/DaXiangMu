// 市场概览相关数据类型定义

// 实时市场数据项
export interface MarketDataItem {
  symbol: string;
  name: string;
  price: number;
  priceChange24h: number;
  priceChange24hRate: number;
  volume24h: number;
  marketCap: number;
  lastUpdated: string;
}

// 市场行业分布
export interface MarketSector {
  sector: string;
  marketCap: number;
  percentage: number;
  performance24h: number;
}

// 实时市场数据
export interface RealTimeMarketData {
  globalStats: {
    totalMarketCap: number;
    totalVolume24h: number;
    marketChange24h: number;
    marketChange24hRate: number;
    btcDominance: number;
    ethDominance: number;
  };
  topCryptocurrencies: MarketDataItem[];
  marketSectors: MarketSector[];
  tradingVolumeHeatmap: {
    symbol: string;
    volume: number;
    intensity: number;
  }[];
  volatilityIndicators: {
    avgMarketVolatility: number;
    fearGreedIndex: number;
    marketSentiment: 'bearish' | 'neutral' | 'bullish';
  };
}

// 投资组合资产项
export interface PortfolioAsset {
  symbol: string;
  name: string;
  quantity: number;
  avgBuyPrice: number;
  currentPrice: number;
  totalCost: number;
  currentValue: number;
  profitLoss: number;
  profitLossRate: number;
  allocationPercentage: number;
  sector: string;
  lastUpdated: string;
}

// 投资组合分析
export interface PortfolioAnalysis {
  summary: {
    totalValue: number;
    totalCost: number;
    totalProfitLoss: number;
    totalProfitLossRate: number;
    assetCount: number;
    topHoldingSymbol: string;
    topHoldingPercentage: number;
  };
  assets: PortfolioAsset[];
  sectorAllocation: MarketSector[];
  performanceHistory: {
    date: string;
    totalValue: number;
    profitLoss: number;
    profitLossRate: number;
  }[];
  riskMetrics: {
    portfolioBeta: number;
    sharpeRatio: number;
    maxDrawdown: number;
    volatility: number;
    diversificationScore: number;
  };
  benchmarkComparison: {
    date: string;
    portfolioPerformance: number;
    benchmarkPerformance: number;
    outperformance: number;
  }[];
}

// AI洞察项
export interface AIInsight {
  id: string;
  title: string;
  content: string;
  confidenceScore: number;
  impactLevel: 'low' | 'medium' | 'high';
  category: 'trend' | 'risk' | 'opportunity' | 'recommendation';
  timestamp: string;
  relatedSymbols?: string[];
}

// AI洞察
export interface AIInsights {
  marketTrends: AIInsight[];
  portfolioRecommendations: AIInsight[];
  riskAlerts: AIInsight[];
  opportunitySpotlights: AIInsight[];
  summary: {
    overallSentiment: 'bearish' | 'neutral' | 'bullish';
    keyFindings: string[];
    recommendedActions: string[];
    lastAnalysisTime: string;
  };
}

// 系统概览数据类型定义
export interface CryptoOverview {
  // 实时市场数据
  realTimeMarketData: RealTimeMarketData;
  
  // 投资组合分析
  portfolioAnalysis: PortfolioAnalysis;
  
  // AI洞察
  aiInsights: AIInsights;

  // 风险评估
  riskAssessment: {
    overallRiskScore: number;
    marketRiskLevel: 'low' | 'medium' | 'high';
    portfolioDiversificationScore: number;
    recommendedActions: string[];
  };

  // 最近活动
  recentActivities: {
    id: string;
    type: 'buy' | 'sell' | 'report' | 'message' | 'alert';
    description: string;
    time: string;
    relatedEntity?: string;
    impactLevel?: 'low' | 'medium' | 'high';
  }[];

  // 系统状态
  systemStatus: {
    lastUpdated: string;
    dataFreshness: string;
    apiStatus: 'normal' | 'degraded' | 'offline';
    aiModelVersion: string;
    dataSourceStatus: {
      marketData: 'online' | 'offline' | 'delayed';
      portfolioData: 'online' | 'offline' | 'delayed';
      aiServices: 'online' | 'offline' | 'degraded';
    };
  };
}