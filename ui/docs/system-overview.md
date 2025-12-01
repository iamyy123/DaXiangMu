# 加密货币交易系统文档

## 1. 系统概述

本系统是一个功能完善的加密货币交易平台，主要包含四大核心模块：市场概览、持仓管理、市场消息和AI报告。系统提供实时市场数据监控、投资组合分析、AI驱动的洞察、持仓管理、交易历史追踪、市场消息实时推送、AI报告生成等功能。

## 2. 核心模块

### 2.1 市场概览模块

#### 功能描述
- 提供实时市场数据监控
- 进行投资组合分析和风险评估
- 生成AI驱动的市场洞察和建议

#### 数据结构
- **RealTimeMarketData**: 实时市场数据，包含主要加密货币的价格、交易量、涨跌幅等信息
- **PortfolioAnalysis**: 投资组合分析，包含资产分布、风险评估、收益分析等
- **AIInsights**: AI洞察，包含市场趋势预测、异常检测、投资建议等

#### API接口
- `getMarketData()`: 获取实时市场数据
- `getPortfolioAnalysis()`: 获取投资组合分析
- `getAIInsights()`: 获取AI洞察

### 2.2 持仓管理模块

#### 功能描述
- 显示当前持仓状态和详情
- 追踪持仓历史记录和交易记录
- 提供盈亏分析和风险评估
- 支持持仓数据导出

#### 数据结构
- **PositionItem**: 持仓项，包含资产信息、数量、成本、市值等
- **PositionHistoryItem**: 持仓历史记录项
- **TransactionRecord**: 交易记录
- **ProfitLossAnalysis**: 盈亏分析
- **PositionRiskAnalysis**: 风险分析

#### API接口
- `getCurrentPosition()`: 获取当前持仓
- `getPositionList()`: 获取持仓列表
- `getPositionHistory()`: 获取持仓历史记录
- `exportPosition()`: 导出持仓数据
- `getProfitLossAnalysis()`: 获取盈亏分析
- `getPositionRiskAnalysis()`: 获取风险分析
- `getTransactionRecords()`: 获取交易记录

### 2.3 市场消息模块

#### 功能描述
- 提供实时市场动态和新闻
- 对消息进行重要性分级和分类
- 进行AI驱动的消息影响分析
- 提供消息统计和趋势分析

#### 数据结构
- **MessageItem**: 消息项，包含标题、内容、来源、发布时间、重要性等
- **RealtimeMessageStreamItem**: 实时消息流项
- **MessageStatistics**: 消息统计信息
- **MessageImpactAnalysis**: 消息影响分析

#### API接口
- `getMessageList()`: 获取消息列表
- `getMessageDetail()`: 获取消息详情
- `getRealtimeMessageStream()`: 获取实时消息流
- `getMessageStatistics()`: 获取消息统计
- `getMessageImpactAnalysis()`: 获取消息影响分析

### 2.4 AI报告模块

#### 功能描述
- 生成定期市场分析报告
- 提供投资建议和风险评估
- 进行技术指标分析
- 支持报告审核和管理

#### 数据结构
- **ReportItem**: 报告项，包含标题、类型、生成时间、摘要等
- **ReportDetail**: 报告详情，包含详细内容、数据源、技术指标分析等
- **TechnicalIndicatorAnalysis**: 技术指标分析
- **InvestmentRecommendation**: 投资建议
- **MarketPrediction**: 市场预测

#### API接口
- `getReportList()`: 获取报告列表
- `getReportDetail()`: 获取报告详情
- `getTechnicalIndicators()`: 获取技术指标分析
- `getInvestmentRecommendations()`: 获取投资建议
- `approveReport()`: 审核通过报告
- `rejectReport()`: 驳回报告

## 3. 数据类型详解

### 3.1 基础数据类型

#### 3.1.1 市场数据相关

```typescript
// 实时市场数据
interface RealTimeMarketData {
  items: MarketDataItem[];
  timestamp: string;
  totalVolume: string;
  marketCap: string;
}

// 市场数据项
interface MarketDataItem {
  symbol: string;
  price: string;
  change24h: string;
  volume24h: string;
  marketCap: string;
  circulatingSupply: string;
}

// 投资组合分析
interface PortfolioAnalysis {
  totalValue: string;
  totalCost: string;
  totalProfit: string;
  profitPercentage: string;
  assetDistribution: AssetDistributionItem[];
  riskAssessment: RiskAssessment;
  performanceTrend: PerformanceTrendPoint[];
}
```

#### 3.1.2 持仓管理相关

```typescript
// 持仓项
interface PositionItem {
  id: string;
  assetName: string;
  assetSymbol: string;
  assetType: AssetType;
  quantity: string;
  cost: string;
  marketValue: string;
  profit: string;
  profitPercentage: string;
  dailyChange: string;
  weeklyChange: string;
  monthlyChange: string;
  riskLevel: RiskLevel;
  holdingsPeriod: string;
  aiAnalysis: AIAnalysis;
}

// 交易记录
interface TransactionRecord {
  id: string;
  positionId: string;
  type: TransactionType;
  quantity: string;
  price: string;
  total: string;
  timestamp: string;
  fee: string;
  status: TransactionStatus;
  source: string;
}

// 盈亏分析
interface ProfitLossAnalysis {
  totalProfit: string;
  totalProfitPercentage: string;
  dailyProfit: string;
  weeklyProfit: string;
  monthlyProfit: string;
  yearlyProfit: string;
  profitBreakdown: ProfitBreakdownItem[];
  profitTrend: ProfitTrendPoint[];
}
```

#### 3.1.3 市场消息相关

```typescript
// 消息项
interface MessageItem {
  id: string;
  title: string;
  content: string;
  source: string;
  publishTime: string;
  importanceLevel: ImportanceLevel;
  categories: MessageCategory[];
  relatedAssets: string[];
  impactScore: number;
  impactAnalysis: MessageImpactAnalysis;
  aiTags: string[];
  isRead: boolean;
}

// 消息影响分析
interface MessageImpactAnalysis {
  predictedEffect: PredictedEffect;
  affectedAssets: AffectedAsset[];
  confidenceLevel: number;
  analysisDetails: string;
}

// 消息统计
interface MessageStatistics {
  totalMessages: number;
  highImportanceCount: number;
  mediumImportanceCount: number;
  lowImportanceCount: number;
  messagesByCategory: Record<MessageCategory, number>;
  recentMessages: number;
  averageImpactScore: number;
}
```

#### 3.1.4 AI报告相关

```typescript
// 报告项
interface ReportItem {
  id: string;
  title: string;
  type: ReportType;
  generatedTime: string;
  nextUpdateDate: string;
  frequency: ReportFrequency;
  summary: string;
  highlights: Highlight[];
  riskLevel: RiskLevel;
  recommendationLevel: RecommendationLevel;
  dataSources: DataSource[];
  isApproved: boolean;
}

// 报告详情
interface ReportDetail {
  reportItem: ReportItem;
  detailedContent: string;
  marketOverview: string;
  technicalIndicators: TechnicalIndicatorAnalysis[];
  fundamentalAnalysis: FundamentalAnalysis;
  marketPredictions: MarketPrediction[];
  investmentRecommendations: InvestmentRecommendation[];
  sectorAnalysis: SectorAnalysis[];
  versionHistory: VersionHistory[];
}

// 技术指标分析
interface TechnicalIndicatorAnalysis {
  assetSymbol: string;
  indicators: TechnicalIndicator[];
  trendAnalysis: string;
  supportResistance: SupportResistance[];
  volumeAnalysis: VolumeAnalysis;
}

// 投资建议
interface InvestmentRecommendation {
  assetSymbol: string;
  recommendation: RecommendationType;
  confidence: number;
  targetPrice: string;
  stopLoss: string;
  timeFrame: string;
  rationale: string;
  riskFactors: string[];
}
```

## 4. Mock数据

系统提供了完整的Mock数据支持，包括：

- 市场概览Mock数据
- 持仓管理Mock数据
- 市场消息Mock数据
- AI报告Mock数据
- 交易记录Mock数据
- 盈亏分析Mock数据

Mock数据存储在 `src/mock/cryptoMock.ts` 文件中，并通过 `src/mock/route.ts` 进行路由配置，支持前端开发和测试。

## 5. 技术栈

- 前端框架：React + TypeScript
- 状态管理：Redux/Context API
- 路由：React Router
- HTTP客户端：Axios
- Mock数据：vite-plugin-mock-dev-server
- UI组件库：(待确定)
- 图表库：(待确定)

## 6. 部署和配置

### 6.1 开发环境

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

### 6.2 生产环境

```bash
# 构建生产版本
npm run build

# 部署到服务器
# (具体部署方式根据服务器环境而定)
```

## 7. 未来功能规划

- 交易执行功能
- 回测系统
- 高级技术分析工具
- 多账户管理
- 移动端适配
- 更多AI驱动的功能

## 8. 联系方式

如有问题或建议，请联系系统管理员。