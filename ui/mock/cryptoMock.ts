import { Request, Response } from 'express';
import Mock from 'mockjs';

// 生成随机日期
const getRandomDate = (days = 30) => {
  const date = new Date();
  date.setDate(date.getDate() - Math.floor(Math.random() * days));
  return date.toISOString();
};

// 生成随机加密货币符号
const cryptoSymbols = ['BTC', 'ETH', 'BNB', 'SOL', 'ADA', 'XRP', 'DOT', 'DOGE', 'AVAX', 'LINK'];
const cryptoNames = {
  'BTC': '比特币',
  'ETH': '以太坊',
  'BNB': '币安币',
  'SOL': '索拉纳',
  'ADA': '卡尔达诺',
  'XRP': '瑞波币',
  'DOT': '波卡',
  'DOGE': '狗狗币',
  'AVAX': '雪崩',
  'LINK': 'Chainlink'
};

// Mock数据配置
const mockData = {
  // 概览数据
  'GET /api/crypto/overview': (req: Request, res: Response) => {
    const overviewData = {
      data: {
        marketOverview: {
          totalMarketCap: Mock.Random.float(1800000000000, 2500000000000, 2, 2),
          totalVolume24h: Mock.Random.float(300000000000, 600000000000, 2, 2),
          marketChange24h: Mock.Random.float(-200000000000, 200000000000, 2, 2),
          marketChange24hRate: Mock.Random.float(-5, 5, 2, 2),
          dominantCrypto: 'BTC',
          dominantPercentage: Mock.Random.float(40, 50, 2, 2)
        },
        keyMetrics: {
          activeMarkets: Mock.Random.integer(100, 200),
          tradingPairs: Mock.Random.integer(5000, 8000),
          activeCryptocurrencies: Mock.Random.integer(9000, 12000),
          newListings24h: Mock.Random.integer(10, 50),
          averageVolatility: Mock.Random.float(3, 8, 2, 2)
        },
        portfolioOverview: {
          totalValue: Mock.Random.float(50000, 500000, 2, 2),
          totalProfitLoss: Mock.Random.float(-50000, 100000, 2, 2),
          totalProfitLossRate: Mock.Random.float(-15, 30, 2, 2),
          holdingCount: Mock.Random.integer(5, 15),
          topHoldingSymbol: 'BTC',
          topHoldingPercentage: Mock.Random.float(30, 60, 2, 2)
        },
        riskAssessment: {
          overallRiskScore: Mock.Random.integer(40, 70),
          marketRiskLevel: Mock.Random.pick(['low', 'medium', 'high']),
          portfolioDiversificationScore: Mock.Random.integer(50, 80),
          recommendedActions: [
            '增加投资组合多样性',
            '考虑设置止损订单',
            '关注市场波动性'
          ]
        },
        aiInsights: {
          recentTrendAnalysis: '市场呈现震荡上行趋势，技术指标显示短期看涨信号。',
          keyOpportunities: ['BTC减半事件影响', 'ETH生态系统增长', '机构资金流入'],
          potentialThreats: ['监管不确定性', '宏观经济风险', '技术漏洞'],
          recommendationSummary: '保持谨慎乐观，适度增加核心资产配置，控制杠杆风险。'
        },
        recentActivities: Array(5).fill(null).map(() => ({
          type: Mock.Random.pick(['buy', 'sell', 'report', 'message', 'alert']),
          description: Mock.Random.sentence(5, 10),
          time: getRandomDate(7),
          relatedEntity: Mock.Random.pick(cryptoSymbols)
        })),
        chartData: {
          timeRange: '30d',
          portfolioValue: Array(30).fill(null).map((_, index) => {
            const baseValue = 100000;
            const fluctuation = Math.sin(index / 5) * 20000 + Math.random() * 10000;
            return {
              date: new Date(Date.now() - (29 - index) * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
              value: baseValue + fluctuation
            };
          }),
          marketComparison: Array(30).fill(null).map((_, index) => {
            const date = new Date(Date.now() - (29 - index) * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
            return {
              date,
              portfolio: 100000 + Math.sin(index / 5) * 20000 + Math.random() * 10000,
              benchmark: 100000 + Math.sin(index / 4) * 15000 + Math.random() * 8000
            };
          })
        },
        systemStatus: {
          lastUpdated: new Date().toISOString(),
          dataFreshness: '实时更新',
          apiStatus: 'normal',
          aiModelVersion: 'v2.3.5'
        }
      },
      success: true,
      message: '获取概览数据成功'
    };
    res.json(overviewData);
  },

  // 持仓数据
  'GET /api/crypto/position/current': (req: Request, res: Response) => {
    const positions = cryptoSymbols.slice(0, 8).map((symbol, index) => ({
      id: index + 1,
      symbol,
      coinName: cryptoNames[symbol as keyof typeof cryptoNames],
      currentPrice: Mock.Random.float(1000, 70000, 2, 2),
      holdingAmount: Mock.Random.float(0.1, 5, 4, 6),
      totalValue: Mock.Random.float(10000, 100000, 2, 2),
      profitLoss: Mock.Random.float(-5000, 15000, 2, 2),
      profitLossRate: Mock.Random.float(-15, 40, 2, 2),
      entryPrice: Mock.Random.float(900, 60000, 2, 2),
      marketValue: Mock.Random.float(10000, 100000, 2, 2),
      change24h: Mock.Random.float(-500, 1000, 2, 2),
      change24hRate: Mock.Random.float(-5, 10, 2, 2),
      riskLevel: Mock.Random.pick(['low', 'medium', 'high']),
      aiAnalysis: 'AI分析显示该资产具有良好的长期增长潜力，但短期波动较大。',
      lastUpdated: new Date().toISOString()
    }));

    const totalValue = positions.reduce((sum, p) => sum + p.totalValue, 0);
    const totalProfitLoss = positions.reduce((sum, p) => sum + p.profitLoss, 0);

    res.json({
      data: positions,
      totalValue,
      totalProfitLoss,
      totalProfitLossRate: totalValue > 0 ? (totalProfitLoss / totalValue) * 100 : 0,
      holdingCount: positions.length,
      success: true
    });
  },

  'GET /api/crypto/position/history': (req: Request, res: Response) => {
    const historyData = Array(20).fill(null).map((_, index) => {
      const symbol = Mock.Random.pick(cryptoSymbols);
      return {
        id: index + 1,
        symbol,
        coinName: cryptoNames[symbol as keyof typeof cryptoNames],
        date: getRandomDate(90),
        closingPrice: Mock.Random.float(1000, 60000, 2, 2),
        holdingAmount: Mock.Random.float(0.1, 5, 4, 6),
        totalValue: Mock.Random.float(5000, 80000, 2, 2),
        profitLoss: Mock.Random.float(-3000, 10000, 2, 2),
        profitLossRate: Mock.Random.float(-10, 30, 2, 2)
      };
    });

    res.json({
      data: historyData,
      total: 100,
      success: true
    });
  },

  // 消息数据
  'GET /api/crypto/message/list': (req: Request, res: Response) => {
    const messages = Array(20).fill(null).map((_, index) => ({
      id: index + 1,
      title: `市场动态：${Mock.Random.pick(cryptoSymbols)}价格${Mock.Random.pick(['上涨', '下跌', '震荡'])}${Mock.Random.integer(1, 10)}%`,
      content: Mock.Random.paragraph(3, 5),
      source: Mock.Random.pick(['CoinDesk', 'CoinTelegraph', 'CryptoSlate', 'Blockchain.com']),
      sourceUrl: 'https://example.com/news/' + Mock.Random.string(8),
      publishTime: getRandomDate(14),
      importance: Mock.Random.pick(['low', 'medium', 'high', 'critical']),
      isCollected: Mock.Random.boolean(),
      readStatus: Mock.Random.pick(['unread', 'read']),
      impactAnalysis: {
        level: Mock.Random.pick(['low', 'medium', 'high']),
        affectedCoins: Mock.Random.shuffle(cryptoSymbols).slice(0, 3),
        summary: '此消息可能对短期市场情绪产生一定影响，但长期趋势不变。'
      },
      aiTags: ['市场分析', '价格走势', '投资建议']
    }));

    res.json({
      data: messages,
      total: 100,
      page: 1,
      pageSize: 20,
      unreadCount: 25,
      uncollectedCount: 60,
      success: true
    });
  },

  'GET /api/crypto/message/:id': (req: Request, res: Response) => {
    const { id } = req.params;
    const messageDetail = {
      id: parseInt(id),
      title: `详细消息：${Mock.Random.pick(cryptoSymbols)}最新市场分析`,
      content: Mock.Random.paragraph(10, 20),
      source: Mock.Random.pick(['CoinDesk', 'CoinTelegraph', 'CryptoSlate']),
      sourceUrl: 'https://example.com/news/' + id,
      publishTime: getRandomDate(7),
      importance: Mock.Random.pick(['low', 'medium', 'high', 'critical']),
      isCollected: Mock.Random.boolean(),
      readStatus: 'read',
      impactAnalysis: {
        level: 'medium',
        affectedCoins: cryptoSymbols.slice(0, 4),
        summary: Mock.Random.paragraph(2, 3)
      },
      aiTags: ['深度分析', '技术面', '基本面'],
      relatedMessages: Array(3).fill(null).map((_, idx) => ({
        id: 100 + idx,
        title: Mock.Random.sentence(5, 8),
        publishTime: getRandomDate(30)
      }))
    };

    res.json({
      data: messageDetail,
      success: true
    });
  },

  'POST /api/crypto/message/collect': (req: Request, res: Response) => {
    res.json({
      success: true,
      message: '收藏成功'
    });
  },

  // 报告数据
  'GET /api/crypto/ai/report/list': (req: Request, res: Response) => {
    const reports = Array(15).fill(null).map((_, index) => {
      const recommendation = Mock.Random.pick(['strong_buy', 'buy', 'hold', 'sell', 'strong_sell']);
      return {
        id: index + 1,
        title: `2024年${Mock.Random.month()}${Mock.Random.pick(['比特币', '以太坊', '加密货币市场'])}${Mock.Random.pick(['展望', '分析报告', '投资策略'])}`,
        summary: Mock.Random.paragraph(1, 2),
        publishDate: getRandomDate(60),
        author: `AI分析师${Mock.Random.integer(101, 999)}号`,
        reportType: Mock.Random.pick(['daily', 'weekly', 'monthly', 'special']),
        status: Mock.Random.pick(['pending', 'approved']),
        viewCount: Mock.Random.integer(100, 10000),
        downloadCount: Mock.Random.integer(50, 5000),
        recommendation,
        marketTrend: Mock.Random.pick(['bullish', 'bearish', 'neutral']),
        riskAssessment: {
          overall: Mock.Random.pick(['low', 'medium', 'high']),
          factors: ['监管风险', '市场波动性', '流动性风险']
        },
        keyFindings: Array(3).fill(null).map(() => Mock.Random.sentence(8, 12)),
        coverImage: `https://example.com/covers/report_${index + 1}.png`
      };
    });

    res.json({
      data: reports,
      total: 80,
      page: 1,
      pageSize: 15,
      pendingCount: 5,
      approvedCount: 75,
      success: true
    });
  },

  'GET /api/crypto/ai/report/:id': (req: Request, res: Response) => {
    const { id } = req.params;
    const reportDetail = {
      id: parseInt(id),
      title: `2024年加密货币市场深度分析报告`,
      summary: '本报告对当前加密货币市场进行全面分析，包括技术面、基本面和市场情绪等多维度评估。',
      publishDate: getRandomDate(30),
      author: 'AI分析团队',
      reportType: 'special',
      status: 'approved',
      viewCount: 2580,
      downloadCount: 1245,
      recommendation: 'buy',
      marketTrend: 'bullish',
      riskAssessment: {
        overall: 'medium',
        factors: ['监管不确定性增加', '市场波动性上升', '机构参与度提高']
      },
      keyFindings: [
        '比特币减半事件后价格表现优于历史同期',
        '以太坊网络活跃度持续增长',
        'DeFi和NFT市场呈现复苏迹象',
        '机构投资者入场加速'
      ],
      coverImage: 'https://example.com/covers/main_report.png',
      fullContent: Mock.Random.paragraph(20, 30),
      methodology: '本报告采用量化分析与定性研究相结合的方法，基于历史数据和当前市场指标。',
      dataSources: ['交易所API数据', '链上数据分析', '社交媒体情绪分析', '专业机构报告'],
      technicalIndicators: [
        { indicator: 'RSI', value: '65', interpretation: '处于中性偏强势区域' },
        { indicator: 'MACD', value: '金叉', interpretation: '短期看涨信号' },
        { indicator: '布林带', value: '扩张', interpretation: '波动性增加' }
      ],
      fundamentalAnalysis: [
        { section: '网络健康度', content: '主要公链交易数量和活跃地址持续增长' },
        { section: '开发者活动', content: 'GitHub提交频率保持稳定，新项目数量增加' },
        { section: '市场结构', content: '机构持仓比例上升，散户参与度波动' }
      ],
      marketPredictions: [
        { timeframe: '短期(1-3个月)', prediction: '区间震荡上行', confidence: 75 },
        { timeframe: '中期(3-6个月)', prediction: '突破前高，创新高', confidence: 80 },
        { timeframe: '长期(6-12个月)', prediction: '牛市延续，关注监管变化', confidence: 70 }
      ]
    };

    res.json({
      data: reportDetail,
      relatedReports: Array(3).fill(null).map((_, idx) => ({
        id: 100 + idx,
        title: Mock.Random.sentence(8, 12),
        publishDate: getRandomDate(60)
      })),
      success: true
    });
  },

  'POST /api/crypto/review/approve': (req: Request, res: Response) => {
    res.json({
      success: true,
      message: '报告审核通过'
    });
  },

  'POST /api/crypto/review/reject': (req: Request, res: Response) => {
    res.json({
      success: true,
      message: '报告审核驳回'
    });
  }
};

module.exports = mockData;