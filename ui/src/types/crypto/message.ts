// 消息分类类型
export type MessageCategory = 'news' | 'announcement' | 'analysis' | 'alert' | 'research' | 'regulatory';

// 影响级别类型
export type ImpactLevel = 'low' | 'medium' | 'high' | 'critical';

// 资产影响分析项
export interface AssetImpactAnalysis {
  symbol: string;
  name: string;
  expectedImpact: ImpactLevel;
  confidenceScore: number;
  priceChangeProjection?: {
    min: number;
    max: number;
    probability: number;
  };
  timeHorizon: 'short' | 'medium' | 'long';
  rationale: string;
}

// 市场部门影响
export interface SectorImpact {
  sector: string;
  impactLevel: ImpactLevel;
  affectedAssets: string[];
  marketCapChange: number;
  marketCapChangePercentage: number;
}

// AI影响分析详情
export interface AIImpactAnalysis {
  overallImpact: ImpactLevel;
  confidenceScore: number;
  affectedAssets: AssetImpactAnalysis[];
  affectedSectors: SectorImpact[];
  marketSentimentChange: 'bearish' | 'neutral' | 'bullish';
  historicalSimilarityScore: number;
  potentialMarketReaction: string[];
  recommendedActions: string[];
  keyInsights: string[];
  analysisTimestamp: string;
  modelVersion: string;
}

// 消息项类型定义
export interface MessageItem {
  id: string;
  title: string;
  summary: string;
  content: string;
  source: string;
  sourceUrl?: string;
  publishTime: string;
  lastUpdatedTime: string;
  importance: ImpactLevel;
  urgency: 'normal' | 'urgent' | 'breaking';
  category: MessageCategory;
  isCollected: boolean;
  readStatus: 'unread' | 'read';
  tags: string[];
  aiTags: string[];
  entities: Array<{
    name: string;
    type: 'crypto' | 'exchange' | 'person' | 'company' | 'event' | 'country' | 'regulation';
    relevanceScore: number;
  }>;
  impactAnalysis: AIImpactAnalysis;
  sentimentAnalysis: {
    overall: 'negative' | 'neutral' | 'positive';
    confidence: number;
    keyPhrases: string[];
  };
  isVerified: boolean;
  engagement: {
    views: number;
    shares: number;
    comments: number;
    likes: number;
    collectionRate: number;
  };
}

// 实时消息流项
export interface RealtimeMessageStreamItem {
  message: MessageItem;
  streamType: 'new' | 'update' | 'breaking' | 'correction';
  timeReceived: string;
  priorityScore: number;
  notificationEnabled: boolean;
}

// 消息统计数据
export interface MessageStatistics {
  totalCount: number;
  unreadCount: number;
  uncollectedCount: number;
  byImportance: {
    low: number;
    medium: number;
    high: number;
    critical: number;
  };
  byCategory: Record<MessageCategory, number>;
  recentUnreadCount: number;
  dailyCount: number;
}

// 消息列表响应类型
export interface MessageListResponse {
  data: MessageItem[];
  pagination: {
    current: number;
    pageSize: number;
    total: number;
  };
  statistics: MessageStatistics;
  filters: {
    applied: Record<string, any>;
    availableCategories: Record<MessageCategory, number>;
    availableSources: Array<{
      name: string;
      count: number;
    }>;
  };
}

// 消息详情响应类型
export interface MessageDetailResponse {
  data: MessageItem;
  relatedMessages?: Array<{
    id: string;
    title: string;
    publishTime: string;
    importance: ImpactLevel;
    relevanceScore: number;
  }>;
  relatedReports?: Array<{
    id: string;
    title: string;
    publishDate: string;
    relevanceScore: number;
  }>;
  relatedAssets?: Array<{
    symbol: string;
    name: string;
    currentPrice: number;
    priceChange24h: number;
    priceChange24hRate: number;
  }>;
  timelineContext?: Array<{
    id: string;
    title: string;
    publishTime: string;
    summary: string;
  }>;
}

// 消息订阅设置
export interface MessageSubscriptionSettings {
  categories: Array<{
    category: MessageCategory;
    enabled: boolean;
    minimumImportance: ImpactLevel;
  }>;
  assets: Array<{
    symbol: string;
    enabled: boolean;
    minimumImpact: ImpactLevel;
  }>;
  sources: Array<{
    source: string;
    enabled: boolean;
  }>;
  notifications: {
    email: boolean;
    push: boolean;
    sms: boolean;
    minimumImportance: ImpactLevel;
    minimumUrgency: 'normal' | 'urgent' | 'breaking';
  };
}