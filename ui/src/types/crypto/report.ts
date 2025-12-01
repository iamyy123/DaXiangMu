// 报告频率类型
export type ReportFrequency = 'daily' | 'weekly' | 'monthly' | 'quarterly' | 'annual' | 'special';

// 推荐级别类型
export type RecommendationLevel = 'strong_buy' | 'buy' | 'hold' | 'sell' | 'strong_sell';

// 市场趋势类型
export type MarketTrend = 'bullish' | 'bearish' | 'neutral' | 'sideways' | 'volatile';

// 风险等级类型
export type RiskLevel = 'low' | 'medium' | 'high' | 'very_high';

// 技术指标分析类型
export interface TechnicalIndicatorAnalysis {
  name: string;
  value: number | string;
  interpretation: string;
  status: 'bullish' | 'bearish' | 'neutral';
  change: number;
  period: string;
  importance: number; // 1-10 scale
}

// AI预测类型
export interface AIPrediction {
  timeframe: string;
  prediction: string;
  confidence: number;
  probability: {
    bullish: number;
    bearish: number;
    neutral: number;
  };
  supportingFactors: string[];
  conflictingFactors: string[];
}

// 投资建议类型
export interface InvestmentRecommendation {
  level: RecommendationLevel;
  rationale: string;
  timeHorizon: 'short' | 'medium' | 'long';
  entryPriceRange?: [number, number];
  exitPriceTargets?: [number, number];
  stopLossLevel?: number;
  portfolioAllocation?: number; // percentage
  confidenceScore: number;
  supportingAnalysis: string[];
}

// 报告项类型定义
export interface ReportItem {
  id: string;
  title: string;
  summary: string;
  publishDate: string;
  nextUpdateDate?: string;
  author: string;
  reportType: ReportFrequency;
  status: 'draft' | 'pending' | 'approved' | 'rejected';
  viewCount: number;
  downloadCount: number;
  recommendation: RecommendationLevel;
  marketTrend: MarketTrend;
  riskAssessment: {
    overall: RiskLevel;
    factors: string[];
    mitigationStrategies: string[];
  };
  keyFindings: string[];
  coverImage?: string;
  tags: string[];
  aiConfidenceScore: number;
  relatedAssets: string[];
  highlights: {
    type: 'price' | 'volume' | 'news' | 'technical' | 'fundamental';
    description: string;
    importance: number;
  }[];
}

// 报告详情类型定义
export interface ReportDetail extends ReportItem {
  fullContent: string;
  methodology: string;
  dataSources: { name: string; type: string; reliability: number }[];
  technicalIndicators: TechnicalIndicatorAnalysis[];
  fundamentalAnalysis: {
    section: string;
    content: string;
    impactScore: number;
  }[];
  marketPredictions: AIPrediction[];
  investmentRecommendations: InvestmentRecommendation[];
  sectorAnalysis: {
    sector: string;
    performance: number;
    outlook: 'positive' | 'negative' | 'neutral';
    keyAssets: string[];
  }[];
  correlationAnalysis?: {
    assets: string[];
    correlation: number;
    implications: string;
  }[];
  appendix?: string;
  historicalAccuracy?: {
    timeframe: string;
    correctPredictions: number;
    totalPredictions: number;
    accuracyRate: number;
  };
  aiInsights: {
    type: string;
    content: string;
    confidenceLevel: number;
    timestamp: string;
  }[];
  references: {
    id: string;
    title: string;
    url: string;
    date?: string;
  }[];
}

// 报告列表响应类型
export interface ReportListResponse {
  data: ReportItem[];
  total: number;
  page: number;
  pageSize: number;
  pendingCount: number;
  approvedCount: number;
  statistics: {
    totalReports: number;
    byType: Record<ReportFrequency, number>;
    byRecommendation: Record<RecommendationLevel, number>;
    byMarketTrend: Record<MarketTrend, number>;
    recentReports: number;
    averageViewCount: number;
  };
  pagination: {
    currentPage: number;
    totalPages: number;
    hasNextPage: boolean;
    hasPrevPage: boolean;
  };
}

// 报告详情响应类型
export interface ReportDetailResponse {
  data: ReportDetail;
  relatedReports?: {
    id: string;
    title: string;
    publishDate: string;
    reportType: ReportFrequency;
    recommendation: RecommendationLevel;
    summary: string;
  }[];
  feedbackStats?: {
    helpfulCount: number;
    notHelpfulCount: number;
    comments: number;
    rating: number;
  };
  readerComments?: {
    id: string;
    userId: string;
    userName: string;
    content: string;
    timestamp: string;
    likes: number;
    parentCommentId?: string;
  }[];
  versionHistory?: {
    version: string;
    updatedAt: string;
    changes: string[];
    updatedBy: string;
  }[];
}