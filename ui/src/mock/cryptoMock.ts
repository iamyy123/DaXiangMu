import type {
  CryptoOverview,
  RealTimeMarketData,
  PortfolioAnalysis,
  AIInsights
} from '@/types/crypto/overview';
import type {
  PositionItem,
  TransactionRecord,
  ProfitLossAnalysis
} from '@/types/crypto/position';
import type {
  MessageItem,
  MessageListResponse,
  RealtimeMessageStreamItem
} from '@/types/crypto/message';
import type {
  ReportItem,
  ReportDetail,
  ReportListResponse as CryptoReportListResponse
} from '@/types/crypto/report';

// 生成随机数据的辅助函数
const randomFloat = (min: number, max: number, decimals: number = 2) => {
  return Number((Math.random() * (max - min) + min).toFixed(decimals));
};

const randomInt = (min: number, max: number) => {
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

const getRandomDate = (start: Date, end: Date) => {
  return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
};

const formatDate = (date: Date) => {
  return date.toISOString();
};

// 市场概览Mock数据
export const overviewMock: CryptoOverview = {
  id: 'overview-1',
  timestamp: formatDate(new Date()),
  realTimeMarketData: {
    globalMarketCap: randomFloat(2.5, 3.5, 2) * 1000000000000,
    totalVolume: randomFloat(250, 400, 2) * 1000000000,
    btcDominance: randomFloat(40, 50, 2),
    marketTrend: 'bullish',
    majorIndexes: [
      { name: 'BTC', price: randomFloat(55000, 65000), change24h: randomFloat(-3, 5), volume: randomFloat(25, 35) * 1000000000 },
      { name: 'ETH', price: randomFloat(2500, 3500), change24h: randomFloat(-5, 7), volume: randomFloat(15, 25) * 1000000000 },
      { name: 'BNB', price: randomFloat(300, 400), change24h: randomFloat(-4, 6), volume: randomFloat(2, 5) * 1000000000 },
      { name: 'SOL', price: randomFloat(100, 150), change24h: randomFloat(-6, 8), volume: randomFloat(3, 7) * 1000000000 },
      { name: 'ADA', price: randomFloat(0.5, 0.8), change24h: randomFloat(-4, 5), volume: randomFloat(1, 3) * 1000000000 }
    ],
    topGainers: [
      { name: 'DOGE', price: randomFloat(0.05, 0.1), change24h: randomFloat(10, 30) },
      { name: 'SHIB', price: randomFloat(0.00001, 0.00003), change24h: randomFloat(15, 35) },
      { name: 'AVAX', price: randomFloat(30, 50), change24h: randomFloat(8, 15) }
    ],
    topLosers: [
      { name: 'DOT', price: randomFloat(6, 9), change24h: randomFloat(-15, -5) },
      { name: 'LINK', price: randomFloat(10, 15), change24h: randomFloat(-10, -3) },
      { name: 'AAVE', price: randomFloat(80, 120), change24h: randomFloat(-12, -4) }
    ],
    sectorPerformance: [
      { name: 'Layer-1', performance: randomFloat(2, 5) },
      { name: 'DeFi', performance: randomFloat(-1, 3) },
      { name: 'NFT', performance: randomFloat(-3, 2) },
      { name: 'Web3', performance: randomFloat(1, 4) }
    ]
  },
  portfolioAnalysis: {
    totalValue: randomFloat(20000, 50000),
    dailyChange: randomFloat(-2000, 3000),
    weeklyChange: randomFloat(-5000, 8000),
    monthlyChange: randomFloat(-10000, 15000),
    assetDistribution: [
      { asset: 'BTC', allocation: 40, value: 16000 },
      { asset: 'ETH', allocation: 30, value: 12000 },
      { asset: 'SOL', allocation: 15, value: 6000 },
      { asset: 'Others', allocation: 15, value: 6000 }
    ],
    riskScore: randomInt(3, 7),
    historicalPerformance: [
      { date: '2024-01', value: 25000 },
      { date: '2024-02', value: 28000 },
      { date: '2024-03', value: 32000 },
      { date: '2024-04', value: 38000 },
      { date: '2024-05', value: 35000 }
    ],
    performanceMetrics: {
      roi: randomFloat(20, 40),
      volatility: randomFloat(15, 25),
      sharpeRatio: randomFloat(0.8, 1.5)
    }
  },
  aiInsights: {
    summary: '当前市场呈现上升趋势，BTC和ETH表现强劲，建议保持适度仓位，关注美联储政策变化。',
    keyPredictions: [
      { prediction: 'BTC可能在近期突破65,000美元', confidence: 0.75, timeframe: '1周' },
      { prediction: 'ETH/USDT有望上涨10%', confidence: 0.65, timeframe: '2周' },
      { prediction: '市场波动性将增加', confidence: 0.8, timeframe: '1月' }
    ],
    riskWarnings: [
      { category: '市场风险', level: 'medium', message: '短期可能出现回调，建议设置止损' },
      { category: '监管风险', level: 'low', message: '需关注各国最新监管动向' }
    ],
    opportunities: [
      { asset: 'SOL', reason: '生态系统持续扩张，机构采纳增加', confidence: 0.85 },
      { asset: 'ETH', reason: 'ETF申请进展顺利，Layer 2解决方案成熟', confidence: 0.8 }
    ],
    marketSentiment: 'moderately_bullish',
    sentimentScore: randomFloat(60, 75)
  },
  recentActivities: [
    { id: 'act-1', type: 'trade', asset: 'BTC', action: 'buy', amount: 0.2, price: 62000, timestamp: formatDate(getRandomDate(new Date('2024-05-01'), new Date())) },
    { id: 'act-2', type: 'news', title: '美联储宣布降息25个基点', impact: 'high', timestamp: formatDate(getRandomDate(new Date('2024-05-01'), new Date())) }
  ],
  systemStatus: {
    status: 'operational',
    lastUpdated: formatDate(new Date()),
    version: '1.0.0',
    dataFreshness: 'real-time'
  }
};

// 持仓数据Mock数据 - 基于SQL脚本的价格信息
export const positionsMock: PositionItem[] = [
  {
    id: 'pos-1',
    asset: 'BTC',
    symbol: 'BTC/USDT',
    quantity: 61.53846154, // 基于SQL中的价格计算
    averagePrice: 65000.00,
    currentPrice: 65000.00,
    totalValue: 4000000.00,
    unrealizedPnl: 0,
    unrealizedPnlPercent: 0,
    change24h: 2.5,
    change7d: 5.8,
    change30d: 12.3,
    assetType: 'cryptocurrency',
    blockchain: 'Bitcoin',
    walletAddress: 'bc1q...',
    riskLevel: 'high',
    allocation: 60,
    tradingHistory: [
      { date: '2024-05-10', action: 'buy', quantity: 30.0, price: 65000 },
      { date: '2024-05-01', action: 'buy', quantity: 31.53846154, price: 65000 }
    ],
    aiAnalysis: {
      outlook: 'positive',
      confidence: 0.85,
      recommendation: 'hold',
      keyFactors: ['机构资金持续流入', 'ETF持仓增加', '市场主导地位稳固']
    }
  },
  {
    id: 'pos-2',
    asset: 'ETH',
    symbol: 'ETH/USDT',
    quantity: 142.85714286, // 基于100万美元价值计算
    averagePrice: 3500.00,
    currentPrice: 3500.00,
    totalValue: 500000.00,
    unrealizedPnl: 0,
    unrealizedPnlPercent: 0,
    change24h: 1.8,
    change7d: 4.2,
    change30d: 9.7,
    assetType: 'cryptocurrency',
    blockchain: 'Ethereum',
    walletAddress: '0x...',
    riskLevel: 'medium',
    allocation: 25,
    tradingHistory: [
      { date: '2024-04-28', action: 'buy', quantity: 100.0, price: 3500 },
      { date: '2024-04-15', action: 'buy', quantity: 42.85714286, price: 3500 }
    ],
    aiAnalysis: {
      outlook: 'positive',
      confidence: 0.8,
      recommendation: 'buy',
      keyFactors: ['Layer 2生态繁荣', '质押量增加', '开发者活跃度高']
    }
  },
  {
    id: 'pos-3',
    asset: 'SOL',
    symbol: 'SOL/USDT',
    quantity: 2000.0, // 基于30万美元价值计算
    averagePrice: 150.00,
    currentPrice: 150.00,
    totalValue: 300000.00,
    unrealizedPnl: 0,
    unrealizedPnlPercent: 0,
    change24h: -0.8,
    change7d: 3.5,
    change30d: 10.5,
    assetType: 'cryptocurrency',
    blockchain: 'Solana',
    walletAddress: '3GJt...',
    riskLevel: 'high',
    allocation: 10,
    tradingHistory: [
      { date: '2024-05-18', action: 'buy', quantity: 1000.0, price: 150 },
      { date: '2024-05-01', action: 'buy', quantity: 1000.0, price: 150 }
    ],
    aiAnalysis: {
      outlook: 'positive',
      confidence: 0.8,
      recommendation: 'hold',
      keyFactors: ['生态系统增长迅速', '交易速度优势', '机构兴趣增加']
    }
  },
  {
    id: 'pos-4',
    asset: 'USDT',
    symbol: 'USDT/USDT',
    quantity: 100000.00,
    averagePrice: 1.00,
    currentPrice: 1.00,
    totalValue: 100000.00,
    unrealizedPnl: 0,
    unrealizedPnlPercent: 0,
    change24h: 0,
    change7d: 0,
    change30d: 0,
    assetType: 'stablecoin',
    blockchain: 'Multiple',
    walletAddress: 'multiple',
    riskLevel: 'low',
    allocation: 5,
    tradingHistory: [
      { date: '2024-05-20', action: 'deposit', quantity: 100000.00, price: 1.00 }
    ],
    aiAnalysis: {
      outlook: 'neutral',
      confidence: 1.0,
      recommendation: 'hold',
      keyFactors: ['稳定币储备充足', '用于短期交易机会', '降低整体组合风险']
    }
  }
];

export const transactionsMock: TransactionRecord[] = [
  { id: 'tx-1', asset: 'BTC', type: 'buy', quantity: 0.2, price: 62000, total: 12400, timestamp: formatDate(getRandomDate(new Date('2024-05-10'), new Date())), status: 'completed', fee: 15.5 },
  { id: 'tx-2', asset: 'ETH', type: 'sell', quantity: 0.5, price: 3100, total: 1550, timestamp: formatDate(getRandomDate(new Date('2024-05-05'), new Date('2024-05-10'))), status: 'completed', fee: 4.8 },
  { id: 'tx-3', asset: 'SOL', type: 'buy', quantity: 10.0, price: 105, total: 1050, timestamp: formatDate(getRandomDate(new Date('2024-05-01'), new Date('2024-05-05'))), status: 'completed', fee: 1.2 }
];

export const profitLossAnalysisMock: ProfitLossAnalysis = {
  summary: {
    totalPnl: 3765,
    totalPnlPercent: 12.8,
    realizedPnl: 1550,
    unrealizedPnl: 2215,
    winningTrades: 18,
    losingTrades: 7,
    winRate: 72
  },
  dailyAnalysis: [
    { date: '2024-05-19', pnl: 245, pnlPercent: 0.65 },
    { date: '2024-05-18', pnl: -180, pnlPercent: -0.48 },
    { date: '2024-05-17', pnl: 560, pnlPercent: 1.5 }
  ],
  assetAnalysis: [
    { asset: 'BTC', realizedPnl: 850, unrealizedPnl: 2000, totalPnl: 2850, pnlPercent: 9.7 },
    { asset: 'ETH', realizedPnl: 700, unrealizedPnl: 1280, totalPnl: 1980, pnlPercent: 14.3 },
    { asset: 'SOL', realizedPnl: 0, unrealizedPnl: 310, totalPnl: 310, pnlPercent: 18.2 },
    { asset: 'AVAX', realizedPnl: 0, unrealizedPnl: 175, totalPnl: 175, pnlPercent: 20 }
  ],
  timePeriodAnalysis: {
    today: 245,
    week: 1250,
    month: 3765,
    year: 18500
  }
};

// 市场消息Mock数据 - 基于SQL脚本的20条数据
export const messagesMock: MessageItem[] = [
  {
    id: 'msg-1',
    coinType: 'BTC',
    title: '比特币ETF资金流入创新高，机构投资者持续看好',
    content: '根据最新数据，比特币ETF本周资金流入达到15亿美元，创历史新高。多家机构分析师认为，这反映了机构投资者对比特币长期价值的认可。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/btc-etf-inflow',
    publishTime: formatDate(new Date(Date.now() - 1 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 5,
    analysisResult: '该消息对BTC构成重大利好。ETF资金流入创新高表明机构投资者信心增强，可能推动BTC价格上涨。影响等级：5/5，建议关注后续资金流向。',
    importance: 'high',
    category: 'market_news',
    tags: ['btc', 'etf', 'institutional'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: true,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['BTC'],
      likelyDirection: 'up',
      expectedMagnitude: 'large',
      confidence: 0.9,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.9,
    relevanceScore: 0.95,
    engagementMetrics: {
      views: 15420,
      shares: 852,
      comments: 128
    },
    relatedArticles: []
  },
  {
    id: 'msg-2',
    coinType: 'ETH',
    title: '以太坊2.0质押量突破3000万ETH，网络安全性提升',
    content: '以太坊2.0质押总量已突破3000万ETH，占总供应量的25%以上。质押量的持续增长表明社区对以太坊网络升级的信心。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/eth-staking',
    publishTime: formatDate(new Date(Date.now() - 2 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: '该消息对ETH构成利好。质押量增长表明网络安全性提升，同时减少了市场流通量，可能对价格产生正面影响。影响等级：4/5。',
    importance: 'medium',
    category: 'technology',
    tags: ['eth', 'staking', 'security'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['ETH'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.85,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.85,
    relevanceScore: 0.9,
    engagementMetrics: {
      views: 8750,
      shares: 425,
      comments: 78
    },
    relatedArticles: []
  },
  {
    id: 'msg-3',
    coinType: 'BTC',
    title: '比特币挖矿难度再次上调，网络算力持续增长',
    content: '比特币网络挖矿难度上调5.2%，达到历史新高。这反映了网络算力的持续增长和矿工对BTC的信心。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/btc-mining',
    publishTime: formatDate(new Date(Date.now() - 3 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 3,
    analysisResult: '挖矿难度上调表明网络算力增长，这是BTC网络健康发展的标志。对价格影响中等，影响等级：3/5。',
    importance: 'medium',
    category: 'network_metrics',
    tags: ['btc', 'mining', 'hashrate'],
    readStatus: 'read',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'medium',
      affectedAssets: ['BTC'],
      likelyDirection: 'up',
      expectedMagnitude: 'small',
      confidence: 0.7,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.75,
    relevanceScore: 0.85,
    engagementMetrics: {
      views: 6240,
      shares: 218,
      comments: 56
    },
    relatedArticles: []
  },
  {
    id: 'msg-4',
    coinType: 'SOL',
    title: 'Solana生态DeFi项目总锁仓量突破50亿美元',
    content: 'Solana生态DeFi项目总锁仓量（TVL）突破50亿美元，创历史新高。多个头部项目宣布将在Solana上部署。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/sol-defi',
    publishTime: formatDate(new Date(Date.now() - 4 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: '该消息对SOL构成利好。TVL增长表明生态活跃度提升，可能吸引更多开发者和用户，推动SOL价格上涨。影响等级：4/5。',
    importance: 'medium',
    category: 'defi',
    tags: ['sol', 'defi', 'tvl'],
    readStatus: 'unread',
    isCollected: true,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['SOL'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.85,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.85,
    relevanceScore: 0.9,
    engagementMetrics: {
      views: 7890,
      shares: 356,
      comments: 89
    },
    relatedArticles: []
  },
  {
    id: 'msg-5',
    coinType: 'ETH',
    title: '以太坊Gas费用持续下降，网络使用成本降低',
    content: '以太坊网络Gas费用较上月下降30%，主要得益于Layer2解决方案的普及。这降低了用户使用以太坊网络的门槛。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/eth-gas',
    publishTime: formatDate(new Date(Date.now() - 5 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 3,
    analysisResult: 'Gas费用下降有利于提升以太坊网络的可访问性，可能吸引更多用户和项目。影响等级：3/5。',
    importance: 'medium',
    category: 'technology',
    tags: ['eth', 'gas', 'layer2'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'medium',
      affectedAssets: ['ETH', 'L2_tokens'],
      likelyDirection: 'up',
      expectedMagnitude: 'small',
      confidence: 0.75,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.75,
    relevanceScore: 0.8,
    engagementMetrics: {
      views: 5430,
      shares: 187,
      comments: 42
    },
    relatedArticles: []
  },
  {
    id: 'msg-6',
    coinType: 'BTC',
    title: '某大型机构宣布将BTC纳入储备资产',
    content: '某知名投资机构宣布将BTC纳入其储备资产配置，计划在未来6个月内逐步增持。该机构管理资产规模超过1000亿美元。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/btc-reserve',
    publishTime: formatDate(new Date(Date.now() - 6 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 5,
    analysisResult: '大型机构将BTC纳入储备资产是重大利好信号，可能引发其他机构跟风，推动BTC价格上涨。影响等级：5/5。',
    importance: 'high',
    category: 'institutional',
    tags: ['btc', 'institutional', 'reserve'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: true,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['BTC', 'all_cryptocurrencies'],
      likelyDirection: 'up',
      expectedMagnitude: 'large',
      confidence: 0.95,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.95,
    relevanceScore: 0.98,
    engagementMetrics: {
      views: 25670,
      shares: 1245,
      comments: 234
    },
    relatedArticles: []
  },
  {
    id: 'msg-7',
    coinType: 'SOL',
    title: 'Solana网络出现短暂拥堵，交易处理速度下降',
    content: 'Solana网络在过去24小时内出现短暂拥堵，部分交易处理时间延长。开发团队正在优化网络性能。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/sol-congestion',
    publishTime: formatDate(new Date(Date.now() - 7 * 24 * 60 * 60 * 1000)),
    sentiment: '利空',
    impactLevel: 2,
    analysisResult: '网络拥堵可能影响用户体验，但属于短期技术问题。如果开发团队能快速解决，影响有限。影响等级：2/5。',
    importance: 'medium',
    category: 'network_metrics',
    tags: ['sol', 'network', 'congestion'],
    readStatus: 'read',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'low',
      affectedAssets: ['SOL'],
      likelyDirection: 'down',
      expectedMagnitude: 'small',
      confidence: 0.65,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.4,
    relevanceScore: 0.75,
    engagementMetrics: {
      views: 4320,
      shares: 156,
      comments: 78
    },
    relatedArticles: []
  },
  {
    id: 'msg-8',
    coinType: 'ETH',
    title: '以太坊核心开发者讨论延迟难度炸弹',
    content: '以太坊核心开发者正在讨论是否延迟难度炸弹，以确保网络在合并前保持稳定。最终决定将在下周公布。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/eth-difficulty',
    publishTime: formatDate(new Date(Date.now() - 8 * 24 * 60 * 60 * 1000)),
    sentiment: '中性',
    impactLevel: 2,
    analysisResult: '该消息对ETH影响中性。难度炸弹延迟是技术性决策，对价格影响有限。影响等级：2/5。',
    importance: 'medium',
    category: 'technology',
    tags: ['eth', 'developers', 'difficulty_bomb'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'low',
      affectedAssets: ['ETH'],
      likelyDirection: 'neutral',
      expectedMagnitude: 'negligible',
      confidence: 0.7,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.5,
    relevanceScore: 0.65,
    engagementMetrics: {
      views: 3890,
      shares: 123,
      comments: 54
    },
    relatedArticles: []
  },
  {
    id: 'msg-9',
    coinType: 'BTC',
    title: '比特币价格突破关键阻力位，技术面看涨',
    content: '比特币价格成功突破65000美元关键阻力位，技术分析师认为这是看涨信号，可能推动价格进一步上涨。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/btc-breakout',
    publishTime: formatDate(new Date(Date.now() - 9 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: '突破关键阻力位是技术面利好信号，可能吸引更多技术交易者入场。影响等级：4/5。',
    importance: 'medium',
    category: 'technical',
    tags: ['btc', 'price', 'resistance'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: true,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['BTC'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.85,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.85,
    relevanceScore: 0.9,
    engagementMetrics: {
      views: 18760,
      shares: 890,
      comments: 178
    },
    relatedArticles: []
  },
  {
    id: 'msg-10',
    coinType: 'ETH',
    title: '以太坊Layer2解决方案Arbitrum日交易量创新高',
    content: 'Arbitrum日交易量突破200万笔，创历史新高。这表明Layer2解决方案正在被广泛采用。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/arbitrum',
    publishTime: formatDate(new Date(Date.now() - 10 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 3,
    analysisResult: 'Layer2交易量增长有利于以太坊生态发展，但直接对ETH价格影响有限。影响等级：3/5。',
    importance: 'medium',
    category: 'layer2',
    tags: ['eth', 'arbitrum', 'layer2'],
    readStatus: 'read',
    isCollected: true,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'medium',
      affectedAssets: ['ETH', 'ARB'],
      likelyDirection: 'up',
      expectedMagnitude: 'small',
      confidence: 0.75,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.75,
    relevanceScore: 0.85,
    engagementMetrics: {
      views: 6780,
      shares: 234,
      comments: 67
    },
    relatedArticles: []
  },
  {
    id: 'msg-11',
    coinType: 'SOL',
    title: 'Solana基金会宣布新的生态扶持计划',
    content: 'Solana基金会宣布将投入1亿美元用于生态项目扶持，重点支持DeFi、NFT和GameFi项目。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/sol-fund',
    publishTime: formatDate(new Date(Date.now() - 11 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: '生态扶持计划有利于Solana生态发展，可能吸引更多项目入驻，推动SOL价格上涨。影响等级：4/5。',
    importance: 'medium',
    category: 'ecosystem',
    tags: ['sol', 'foundation', 'funding'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['SOL', 'solana_ecosystem'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.85,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.85,
    relevanceScore: 0.9,
    engagementMetrics: {
      views: 9870,
      shares: 456,
      comments: 102
    },
    relatedArticles: []
  },
  {
    id: 'msg-12',
    coinType: 'BTC',
    title: '比特币网络哈希率创新高，网络安全增强',
    content: '比特币网络哈希率达到600 EH/s，创历史新高。这反映了矿工对BTC的信心和网络的安全性提升。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/btc-hashrate',
    publishTime: formatDate(new Date(Date.now() - 12 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 3,
    analysisResult: '哈希率增长表明网络安全性提升，这是长期利好因素。影响等级：3/5。',
    importance: 'medium',
    category: 'network_metrics',
    tags: ['btc', 'hashrate', 'security'],
    readStatus: 'read',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'medium',
      affectedAssets: ['BTC'],
      likelyDirection: 'up',
      expectedMagnitude: 'small',
      confidence: 0.7,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.7,
    relevanceScore: 0.8,
    engagementMetrics: {
      views: 5430,
      shares: 210,
      comments: 45
    },
    relatedArticles: []
  },
  {
    id: 'msg-13',
    coinType: 'ETH',
    title: '以太坊开发者发布新版本客户端，性能优化',
    content: '以太坊核心开发者发布新版本客户端，包含多项性能优化和bug修复。建议所有节点尽快升级。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/eth-client',
    publishTime: formatDate(new Date(Date.now() - 13 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 2,
    analysisResult: '客户端升级是常规维护，对价格影响有限。影响等级：2/5。',
    importance: 'low',
    category: 'technology',
    tags: ['eth', 'client', 'upgrade'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'low',
      affectedAssets: ['ETH'],
      likelyDirection: 'up',
      expectedMagnitude: 'negligible',
      confidence: 0.6,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.6,
    relevanceScore: 0.6,
    engagementMetrics: {
      views: 3210,
      shares: 98,
      comments: 32
    },
    relatedArticles: []
  },
  {
    id: 'msg-14',
    coinType: 'SOL',
    title: 'Solana与多家传统金融机构达成合作',
    content: 'Solana宣布与多家传统金融机构达成合作，将在支付和结算领域探索区块链应用。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/sol-partnership',
    publishTime: formatDate(new Date(Date.now() - 14 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: '与传统金融机构合作有利于提升Solana的认可度和应用场景，可能推动SOL价格上涨。影响等级：4/5。',
    importance: 'medium',
    category: 'partnership',
    tags: ['sol', 'traditional_finance', 'partnership'],
    readStatus: 'unread',
    isCollected: true,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['SOL'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.85,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.85,
    relevanceScore: 0.9,
    engagementMetrics: {
      views: 8760,
      shares: 432,
      comments: 98
    },
    relatedArticles: []
  },
  {
    id: 'msg-15',
    coinType: 'BTC',
    title: '比特币现货ETF交易量持续增长',
    content: '比特币现货ETF日交易量达到50亿美元，创历史新高。这表明市场对比特币ETF的需求持续增长。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/btc-etf-volume',
    publishTime: formatDate(new Date(Date.now() - 15 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: 'ETF交易量增长表明市场活跃度提升，可能推动BTC价格上涨。影响等级：4/5。',
    importance: 'medium',
    category: 'etf',
    tags: ['btc', 'etf', 'volume'],
    readStatus: 'read',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['BTC'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.8,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.8,
    relevanceScore: 0.85,
    engagementMetrics: {
      views: 7650,
      shares: 345,
      comments: 87
    },
    relatedArticles: []
  },
  {
    id: 'msg-16',
    coinType: 'ETH',
    title: '以太坊质押收益率下降至3.5%',
    content: '以太坊质押收益率从4.2%下降至3.5%，主要由于质押量持续增长。这反映了市场对以太坊2.0的信心。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/eth-yield',
    publishTime: formatDate(new Date(Date.now() - 16 * 24 * 60 * 60 * 1000)),
    sentiment: '中性',
    impactLevel: 2,
    analysisResult: '质押收益率下降是市场供需关系的正常反映，对价格影响有限。影响等级：2/5。',
    importance: 'medium',
    category: 'staking',
    tags: ['eth', 'staking', 'yield'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'low',
      affectedAssets: ['ETH'],
      likelyDirection: 'neutral',
      expectedMagnitude: 'negligible',
      confidence: 0.65,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.5,
    relevanceScore: 0.7,
    engagementMetrics: {
      views: 4560,
      shares: 178,
      comments: 67
    },
    relatedArticles: []
  },
  {
    id: 'msg-17',
    coinType: 'SOL',
    title: 'Solana网络升级完成，TPS提升至65000',
    content: 'Solana网络完成最新升级，理论TPS从50000提升至65000。这将进一步提升网络处理能力。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/sol-upgrade',
    publishTime: formatDate(new Date(Date.now() - 17 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 3,
    analysisResult: '网络性能提升有利于吸引更多应用，但需要时间验证。影响等级：3/5。',
    importance: 'medium',
    category: 'technology',
    tags: ['sol', 'upgrade', 'tps'],
    readStatus: 'read',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'medium',
      affectedAssets: ['SOL'],
      likelyDirection: 'up',
      expectedMagnitude: 'small',
      confidence: 0.75,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.75,
    relevanceScore: 0.8,
    engagementMetrics: {
      views: 6780,
      shares: 289,
      comments: 76
    },
    relatedArticles: []
  },
  {
    id: 'msg-18',
    coinType: 'BTC',
    title: '比特币鲸鱼地址增持10000枚BTC',
    content: '某大型比特币鲸鱼地址在过去一周增持10000枚BTC，价值约6.5亿美元。这可能表明大额持有者看好BTC长期价值。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/btc-whale',
    publishTime: formatDate(new Date(Date.now() - 18 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: '鲸鱼增持是看涨信号，可能推动BTC价格上涨。影响等级：4/5。',
    importance: 'medium',
    category: 'whale_activity',
    tags: ['btc', 'whale', 'accumulation'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: true,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['BTC'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.85,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.85,
    relevanceScore: 0.92,
    engagementMetrics: {
      views: 18900,
      shares: 987,
      comments: 189
    },
    relatedArticles: []
  },
  {
    id: 'msg-19',
    coinType: 'ETH',
    title: '以太坊DeFi总锁仓量突破1000亿美元',
    content: '以太坊DeFi生态总锁仓量突破1000亿美元，创历史新高。多个头部DeFi项目TVL均实现增长。',
    source: 'CoinGecko',
    sourceUrl: 'https://www.coingecko.com/news/eth-defi',
    publishTime: formatDate(new Date(Date.now() - 19 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 4,
    analysisResult: 'DeFi TVL增长表明生态活跃度提升，有利于ETH价格上涨。影响等级：4/5。',
    importance: 'medium',
    category: 'defi',
    tags: ['eth', 'defi', 'tvl'],
    readStatus: 'read',
    isCollected: true,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'high',
      affectedAssets: ['ETH', 'defi_tokens'],
      likelyDirection: 'up',
      expectedMagnitude: 'moderate',
      confidence: 0.85,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.85,
    relevanceScore: 0.9,
    engagementMetrics: {
      views: 12340,
      shares: 567,
      comments: 145
    },
    relatedArticles: []
  },
  {
    id: 'msg-20',
    coinType: 'SOL',
    title: 'Solana手机Saga销量超预期，生态应用增长',
    content: 'Solana手机Saga销量超预期，带动Solana生态应用下载量增长50%。这提升了Solana的移动端生态。',
    source: 'Binance',
    sourceUrl: 'https://www.binance.com/news/sol-phone',
    publishTime: formatDate(new Date(Date.now() - 20 * 24 * 60 * 60 * 1000)),
    sentiment: '利好',
    impactLevel: 3,
    analysisResult: '手机销量增长有利于Solana生态扩展，但需要时间验证长期影响。影响等级：3/5。',
    importance: 'medium',
    category: 'ecosystem',
    tags: ['sol', 'mobile', 'saga'],
    readStatus: 'unread',
    isCollected: false,
    isBreaking: false,
    aiImpactAnalysis: {
      impactLevel: 'medium',
      affectedAssets: ['SOL'],
      likelyDirection: 'up',
      expectedMagnitude: 'small',
      confidence: 0.7,
      analysisTimestamp: formatDate(new Date())
    },
    sentimentScore: 0.7,
    relevanceScore: 0.8,
    engagementMetrics: {
      views: 7890,
      shares: 345,
      comments: 89
    },
    relatedArticles: []
  }
];

// 市场消息列表响应Mock数据
export const messageListResponseMock: MessageListResponse = {
  data: messagesMock,
  total: 20,
  page: 1,
  pageSize: 10,
  hasMore: true,
  statistics: {
    totalMessages: 20,
    byImportance: { critical: 0, high: 5, medium: 15, low: 0 },
    byCategory: { market_news: 2, regulatory: 0, technology: 5, defi: 2, etf: 2, network_metrics: 3, institutional: 1, layer2: 1, technical: 1, whale_activity: 1, partnership: 1, ecosystem: 2 },
    bySentiment: { positive: 16, negative: 1, neutral: 3 },
    byCoinType: { BTC: 8, ETH: 6, SOL: 6 },
    unreadCount: 15,
    breakingCount: 4,
    latestUpdateTime: formatDate(new Date())
  },
  pagination: {
    currentPage: 1,
    totalPages: 2,
    pageSize: 10
  }
};

// 持仓历史记录Mock数据
export const positionHistoryMock: any[] = [
  {
    id: '1',
    coinType: 'BTC',
    amount: 61.53846154,
    percentage: 45.50,
    usdValue: 2923076.92,
    price: 47500,
    changeType: '定时更新',
    changeReason: '每日快照',
    snapshotDate: '2024-01-20',
    createTime: '2024-01-20 23:59:59'
  },
  {
    id: '2',
    coinType: 'ETH',
    amount: 142.85714286,
    percentage: 25.30,
    usdValue: 1625384.62,
    price: 11378,
    changeType: '定时更新',
    changeReason: '每日快照',
    snapshotDate: '2024-01-20',
    createTime: '2024-01-20 23:59:59'
  },
  {
    id: '3',
    coinType: 'SOL',
    amount: 2000,
    percentage: 10.20,
    usdValue: 656000,
    price: 328,
    changeType: '定时更新',
    changeReason: '每日快照',
    snapshotDate: '2024-01-20',
    createTime: '2024-01-20 23:59:59'
  },
  {
    id: '4',
    coinType: 'BTC',
    amount: 60.53846154,
    percentage: 44.80,
    usdValue: 2886846.15,
    price: 47700,
    changeType: '定时更新',
    changeReason: '每日快照',
    snapshotDate: '2024-01-19',
    createTime: '2024-01-19 23:59:59'
  },
  {
    id: '5',
    coinType: 'ETH',
    amount: 140.85714286,
    percentage: 25.50,
    usdValue: 1615384.62,
    price: 11468,
    changeType: '定时更新',
    changeReason: '每日快照',
    snapshotDate: '2024-01-19',
    createTime: '2024-01-19 23:59:59'
  },
  {
    id: '6',
    coinType: 'BTC',
    amount: 62.53846154,
    percentage: 46.20,
    usdValue: 2963076.92,
    price: 47380,
    changeType: '审核通过调整',
    changeReason: '根据AI分析报告调整持仓',
    snapshotDate: '2024-01-18',
    createTime: '2024-01-18 14:30:00'
  }
];

// 审核日志表Mock数据
export const reviewLogsMock: any[] = [
  {
    id: '1',
    reportId: '1',
    reviewerId: 101,
    reviewerName: '张三',
    reviewResult: 'APPROVED',
    reviewComment: '分析合理，建议采纳',
    reviewTime: '2024-01-15 10:30:00'
  },
  {
    id: '2', 
    reportId: '2',
    reviewerId: 102,
    reviewerName: '李四',
    reviewResult: 'REJECTED',
    reviewComment: '需要更多市场数据支持',
    reviewTime: '2024-01-16 14:45:00'
  },
  {
    id: '3',
    reportId: '1',
    reviewerId: 103,
    reviewerName: '王五',
    reviewResult: 'APPROVED',
    reviewComment: '第二次审核通过',
    reviewTime: '2024-01-15 16:20:00'
  },
  {
    id: '4',
    reportId: '3',
    reviewerId: 101,
    reviewerName: '张三',
    reviewResult: 'APPROVED',
    reviewComment: 'AI分析准确',
    reviewTime: '2024-01-17 09:15:00'
  },
  {
    id: '5',
    reportId: '4',
    reviewerId: 102,
    reviewerName: '李四',
    reviewResult: 'REJECTED',
    reviewComment: '市场趋势判断有误',
    reviewTime: '2024-01-18 11:40:00'
  },
  {
    id: '6',
    reportId: '5',
    reviewerId: 103,
    reviewerName: '王五',
    reviewResult: 'APPROVED',
    reviewComment: '建议合理',
    reviewTime: '2024-01-19 13:55:00'
  }
];

// 消息采集日志表Mock数据
export const collectLogsMock: any[] = [
  {
    id: '1',
    taskDate: '2024-01-20',
    collectStatus: 'SUCCESS',
    messageCount: 35,
    retryCount: 0,
    executeTime: '2024-01-20 00:05:30',
    duration: 12500,
  },
  {
    id: '2',
    taskDate: '2024-01-19',
    collectStatus: 'SUCCESS',
    messageCount: 28,
    retryCount: 0,
    executeTime: '2024-01-19 00:06:15',
    duration: 10800,
  },
  {
    id: '3',
    taskDate: '2024-01-18',
    collectStatus: 'FAILED',
    messageCount: 0,
    retryCount: 2,
    executeTime: '2024-01-18 00:05:45',
    duration: 45000,
    errorMsg: '数据源API连接超时'
  },
  {
    id: '4',
    taskDate: '2024-01-17',
    collectStatus: 'SUCCESS',
    messageCount: 42,
    retryCount: 1,
    executeTime: '2024-01-17 00:10:20',
    duration: 15600,
  },
  {
    id: '5',
    taskDate: '2024-01-16',
    collectStatus: 'SUCCESS',
    messageCount: 31,
    retryCount: 0,
    executeTime: '2024-01-16 00:05:50',
    duration: 11200,
  }
];

// AI分析报告表完整Mock数据扩展
export const aiReportsMock: any[] = [
  {
    id: '1',
    messageId: '1',
    reportDate: '2024-01-15',
    firstAnalysis: '该消息显示美联储可能在Q2降息，对比特币形成重大利好。影响等级评估为4分，情感倾向为正面。',
    positionSnapshot: JSON.stringify(positionsMock.slice(0, 3)),
    secondAnalysis: '基于当前持仓和市场分析，建议增加BTC持仓比例至50%，减少USDT持仓比例。',
    adjustmentSuggestion: JSON.stringify({
      increase: [{ coinType: 'BTC', percentage: 5.0 }],
      decrease: [{ coinType: 'USDT', percentage: 5.0 }],
      hold: ['ETH', 'SOL', 'DOGE']
    }),
    analysisBasis: '美联储降息将增加市场流动性，历史数据显示这对比特币等风险资产有显著正面影响。',
    reportStatus: 'APPROVED',
    createTime: '2024-01-15 08:30:00',
    updateTime: '2024-01-15 16:20:00'
  },
  {
    id: '2',
    messageId: '2',
    reportDate: '2024-01-16',
    firstAnalysis: '比特币ETF资金流入创历史新高，表明机构投资者对比特币的信心增强。影响等级5分，情感倾向正面。',
    positionSnapshot: JSON.stringify(positionsMock.slice(0, 3)),
    secondAnalysis: 'ETF资金持续流入将为比特币提供长期支撑，建议保持高比例持仓。',
    adjustmentSuggestion: JSON.stringify({
      increase: [],
      decrease: [],
      hold: ['BTC', 'ETH', 'SOL', 'USDT', 'DOGE']
    }),
    analysisBasis: '机构资金流入是长期价格支撑的关键因素，当前流入趋势强劲。',
    reportStatus: 'PENDING',
    createTime: '2024-01-16 10:15:00',
    updateTime: '2024-01-16 10:15:00'
  },
  {
    id: '3',
    messageId: '3',
    reportDate: '2024-01-17',
    firstAnalysis: '以太坊Layer2生态系统总锁仓价值(TVL)增长50%，表明扩容解决方案正获得广泛采用。影响等级4分，情感倾向正面。',
    positionSnapshot: JSON.stringify(positionsMock.slice(0, 3)),
    secondAnalysis: 'Layer2的发展将提升以太坊网络性能，增强其竞争力，建议小幅增加ETH持仓。',
    adjustmentSuggestion: JSON.stringify({
      increase: [{ coinType: 'ETH', percentage: 2.0 }],
      decrease: [{ coinType: 'USDT', percentage: 2.0 }],
      hold: ['BTC', 'SOL', 'DOGE']
    }),
    analysisBasis: 'TVL增长反映了开发者和用户对Layer2解决方案的信心。',
    reportStatus: 'APPROVED',
    createTime: '2024-01-17 09:15:00',
    updateTime: '2024-01-17 11:30:00'
  }
];

// 完整的报告关联数据
export const reportsWithRelationsMock = aiReportsMock.map(report => ({
  ...report,
  message: messagesMock.find(m => m.id === report.messageId) || {},
  reviewLogs: reviewLogsMock.filter(log => log.reportId === report.id)
}));

// 实时消息流Mock数据
export const realtimeMessageStreamMock: RealtimeMessageStreamItem[] = [
  { id: 'stream-1', message: 'BTC价格突破63,000美元，24小时涨幅3.5%', type: 'price_alert', timestamp: formatDate(new Date()), importance: 'high', asset: 'BTC' },
  { id: 'stream-2', message: 'ETH/USDT交易量激增，较昨日增长150%', type: 'volume_alert', timestamp: formatDate(new Date(Date.now() - 300000)), importance: 'medium', asset: 'ETH' }
];

// AI报告Mock数据
export const reportsMock: ReportItem[] = [
  {
    id: 'report-1',
    title: '2024年5月比特币市场周报：ETF驱动市场新高',
    summary: '本周比特币价格突破65,000美元，ETF持续资金流入，市场情绪积极。预计短期内可能出现回调，建议逢低买入。',
    publishDate: formatDate(new Date()),
    nextUpdateDate: formatDate(new Date(Date.now() + 7 * 24 * 60 * 60 * 1000)),
    author: 'AI分析团队',
    reportType: 'weekly',
    status: 'approved',
    viewCount: 3250,
    downloadCount: 485,
    recommendation: 'buy',
    marketTrend: 'bullish',
    riskAssessment: {
      overall: 'medium',
      factors: ['市场过热风险', '短期获利回吐压力', '宏观经济不确定性'],
      mitigationStrategies: ['分批建仓', '设置止损', '关注美联储政策变化']
    },
    keyFindings: [
      '比特币ETF连续10天资金净流入',
      '机构持仓占比提升至35%',
      '市场主导地位稳定在45%左右',
      '期货市场溢价处于健康水平'
    ],
    tags: ['比特币', 'ETF', '市场分析', '投资策略'],
    aiConfidenceScore: 0.85,
    relatedAssets: ['BTC', 'ETH', 'SOL'],
    highlights: [
      { type: 'price', description: '突破关键阻力位63,000美元', importance: 9 },
      { type: 'volume', description: '交易量较上周增长40%', importance: 8 },
      { type: 'news', description: '美联储官员暗示年内可能多次降息', importance: 9 },
      { type: 'technical', description: 'RSI指标显示超买，需警惕回调', importance: 7 }
    ]
  },
  {
    id: 'report-2',
    title: '以太坊生态系统月度分析：Layer 2解决方案爆发式增长',
    summary: '以太坊Layer 2网络TVL突破300亿美元，交易量环比增长120%。上海升级后质押率提升，ETH供应紧缩效应显现。',
    publishDate: formatDate(getRandomDate(new Date('2024-05-01'), new Date())),
    nextUpdateDate: formatDate(new Date(Date.now() + 30 * 24 * 60 * 60 * 1000)),
    author: 'AI分析团队',
    reportType: 'monthly',
    status: 'approved',
    viewCount: 2840,
    downloadCount: 376,
    recommendation: 'strong_buy',
    marketTrend: 'bullish',
    riskAssessment: {
      overall: 'low',
      factors: ['网络拥堵风险', '竞争公链压力', '监管不确定性'],
      mitigationStrategies: ['关注技术升级进展', '多元化配置Layer 2生态代币']
    },
    keyFindings: [
      'Layer 2总交易量占以太坊生态系统85%',
      '质押ETH数量达到2500万枚，占总供应量21%',
      '开发者活跃度环比增长15%',
      'DeFi总锁仓量回升至800亿美元'
    ],
    tags: ['以太坊', 'Layer 2', '质押', 'DeFi'],
    aiConfidenceScore: 0.9,
    relatedAssets: ['ETH', 'ARB', 'OP', 'SOL'],
    highlights: [
      { type: 'technical', description: '上海升级成功，提款功能正常运行', importance: 10 },
      { type: 'fundamental', description: '机构采用率持续提升，企业级应用增长', importance: 9 },
      { type: 'news', description: 'ETH ETF申请进展顺利，预计Q3获批', importance: 9 }
    ]
  }
];

// AI报告详情Mock数据
export const reportDetailMock: ReportDetail = {
  ...reportsMock[0],
  fullContent: '# 2024年5月比特币市场周报\n\n## 市场概述\n本周比特币价格表现强劲，突破65,000美元，创下近3个月新高。市场情绪积极，ETF持续资金流入是主要驱动力。\n\n## 详细分析\n### 价格走势\n比特币价格从上周的59,000美元上涨至目前的63,000美元左右，周涨幅约6.8%。技术面上，成功突破63,000美元关键阻力位，短期内有望继续上行。\n\n### 资金流向\n比特币ETF本周净流入资金超过5亿美元，机构投资者持续买入。灰度比特币信托(GBTC)减持速度放缓，对市场压力减小。\n\n### 链上数据分析\n- 矿工持仓稳定，未出现大规模抛售\n- 长期持有者比例增加至65%，显示持有者信心增强\n- 活跃地址数量环比增长12%，网络活跃度提升\n\n## 风险提示\n1. 市场短期涨幅过大，存在获利回吐风险\n2. RSI指标显示超买，可能出现技术性回调\n3. 美联储政策变化可能对市场产生重大影响\n\n## 投资建议\n建议投资者保持理性，采用分批建仓策略，设置止损位控制风险。长期投资者可考虑在回调时增加持仓。\n\n## 附录\n数据来源：Glassnode, CryptoQuant, CoinMetrics\n分析时间：2024年5月第3周',
  methodology: '本报告采用多维度数据分析方法，结合链上数据、市场数据、基本面分析和技术分析，通过AI模型综合评估市场趋势。',
  dataSources: [
    { name: 'Glassnode', type: 'on-chain_analytics', reliability: 0.95 },
    { name: 'CryptoQuant', type: 'market_data', reliability: 0.92 },
    { name: 'CoinMetrics', type: 'network_metrics', reliability: 0.93 },
    { name: 'Bloomberg', type: 'financial_news', reliability: 0.9 }
  ],
  technicalIndicators: [
    { name: 'RSI', value: 72.5, interpretation: '处于超买区域，可能面临回调', status: 'bearish', change: 5.2, period: '14d', importance: 8 },
    { name: 'MACD', value: '0.85', interpretation: '金叉形态，短期看涨', status: 'bullish', change: 0.12, period: '12/26/9', importance: 9 },
    { name: 'Moving Average', value: '58,500', interpretation: '价格远高于均线，强势上涨', status: 'bullish', change: 2.5, period: '50d', importance: 7 }
  ],
  fundamentalAnalysis: [
    { section: '宏观经济', content: '美联储降息预期增强，全球流动性充裕', impactScore: 8.5 },
    { section: '机构采用', content: 'ETF持续资金流入，企业级应用增加', impactScore: 9 },
    { section: '监管环境', content: '监管逐步明朗，合规交易所增加', impactScore: 7.5 }
  ],
  marketPredictions: [
    {
      timeframe: '1周',
      prediction: '价格可能测试65,000-68,000美元区间',
      confidence: 0.75,
      probability: { bullish: 0.6, bearish: 0.2, neutral: 0.2 },
      supportingFactors: ['ETF资金流入', '技术面突破', '市场情绪积极'],
      conflictingFactors: ['RSI超买', '短期涨幅过大']
    },
    {
      timeframe: '1月',
      prediction: '有望突破70,000美元历史高点',
      confidence: 0.8,
      probability: { bullish: 0.7, bearish: 0.15, neutral: 0.15 },
      supportingFactors: ['机构持续买入', '供应紧缩', '宏观环境有利'],
      conflictingFactors: ['获利回吐压力', '全球经济不确定性']
    }
  ],
  investmentRecommendations: [
    {
      level: 'buy',
      rationale: '技术面突破关键阻力位，ETF资金持续流入',
      timeHorizon: 'medium',
      entryPriceRange: [60000, 62000],
      exitPriceTargets: [70000, 75000],
      stopLossLevel: 58000,
      portfolioAllocation: 40,
      confidenceScore: 0.85,
      supportingAnalysis: ['价格突破63,000美元关键阻力位', '成交量配合良好', '机构资金持续流入']
    }
  ],
  sectorAnalysis: [
    { sector: 'Layer 1', performance: 12.5, outlook: 'positive', keyAssets: ['BTC', 'ETH', 'SOL'] },
    { sector: 'DeFi', performance: 8.2, outlook: 'positive', keyAssets: ['UNI', 'AAVE', 'MKR'] },
    { sector: 'Layer 2', performance: 15.8, outlook: 'positive', keyAssets: ['ARB', 'OP', 'MATIC'] }
  ],
  correlationAnalysis: [
    { assets: ['BTC', 'ETH'], correlation: 0.85, implications: '高度正相关，ETH通常跟随BTC走势' },
    { assets: ['BTC', 'NASDAQ'], correlation: 0.65, implications: '与科技股保持中等相关性，宏观因素影响相似' }
  ],
  historicalAccuracy: {
    timeframe: '3 months',
    correctPredictions: 14,
    totalPredictions: 18,
    accuracyRate: 77.8
  },
  aiInsights: [
    { type: 'market_trend', content: '市场情绪指数处于6个月来最高水平，通常预示短期可能过热', confidenceLevel: 0.85, timestamp: formatDate(new Date()) },
    { type: 'risk_assessment', content: '建议设置10-15%的止损位，防范短期回调风险', confidenceLevel: 0.9, timestamp: formatDate(new Date()) }
  ],
  references: [
    { id: 'ref-1', title: '比特币ETF资金流向周报', url: 'https://example.com/bitcoin-etf-report', date: '2024-05-15' },
    { id: 'ref-2', title: '美联储货币政策会议纪要', url: 'https://example.com/fed-minutes', date: '2024-05-12' }
  ]
};

// AI报告列表响应Mock数据
export const reportListResponseMock: CryptoReportListResponse = {
  data: reportsMock,
  total: 15,
  page: 1,
  pageSize: 10,
  pendingCount: 2,
  approvedCount: 13,
  statistics: {
    totalReports: 15,
    byType: { daily: 8, weekly: 3, monthly: 2, quarterly: 1, annual: 0, special: 1 },
    byRecommendation: { strong_buy: 4, buy: 6, hold: 3, sell: 1, strong_sell: 1 },
    byMarketTrend: { bullish: 8, bearish: 2, neutral: 3, sideways: 1, volatile: 1 },
    recentReports: 5,
    averageViewCount: 2540
  },
  pagination: {
    currentPage: 1,
    totalPages: 2,
    hasNextPage: true,
    hasPrevPage: false
  }
};