import { defineMock } from 'vite-plugin-mock-dev-server';
import {
  overviewMock,
  positionsMock,
  transactionsMock,
  profitLossAnalysisMock,
  messagesMock,
  messageListResponseMock,
  realtimeMessageStreamMock,
  reportsMock,
  reportDetailMock,
  reportListResponseMock,
  positionHistoryMock,
  reviewLogsMock,
  collectLogsMock,
  aiReportsMock,
  reportsWithRelationsMock
} from './cryptoMock';

export default defineMock([
  // 市场概览相关路由
  {
    url: '/api/crypto/overview',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: overviewMock,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/market/data',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: overviewMock.realTimeMarketData,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/portfolio/analysis',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: overviewMock.portfolioAnalysis,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/insights/ai',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: overviewMock.aiInsights,
        message: '获取成功',
      };
    },
  },
  
  // 持仓管理相关路由
  {
    url: '/api/crypto/position/list',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: positionsMock,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/position/detail/:id',
    method: 'GET',
    response: (params: any) => {
      const position = positionsMock.find(p => p.id === params.id);
      return {
        success: true,
        data: position,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/position/transactions',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: transactionsMock,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/position/profit-loss',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: profitLossAnalysisMock,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/position/history',
    method: 'GET',
    response: (params: any) => {
      const coinType = params.coinType ? String(params.coinType).toUpperCase() : null;
      
      let filteredHistory = [...positionHistoryMock];
      
      if (coinType) {
        filteredHistory = filteredHistory.filter(item => item.coinType === coinType);
      }
      
      // 按日期排序，最新的在前
      filteredHistory.sort((a, b) => new Date(b.snapshotDate).getTime() - new Date(a.snapshotDate).getTime());
      
      return {
        success: true,
        data: filteredHistory,
        message: '获取持仓历史记录成功',
      };
    },
  },
  {
    url: '/api/crypto/position/:id/history',
    method: 'GET',
    response: (params: any) => {
      const id = params.id;
      const days = Number(params.days) || 7;
      
      // 获取指定ID的持仓历史记录
      const positionHistory = positionHistoryMock
        .filter(item => item.positionId === id)
        .sort((a, b) => new Date(b.snapshotDate).getTime() - new Date(a.snapshotDate).getTime())
        .slice(0, days);
      
      return {
        success: true,
        data: positionHistory,
        message: `获取持仓ID:${id}的历史记录成功`,
      };
    },
  },
  
  // 市场消息相关路由
  {
    url: '/api/crypto/message/list',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: messageListResponseMock,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/message/detail/:id',
    method: 'GET',
    response: (params: any) => {
      const message = messagesMock.find(m => m.id === params.id);
      return {
        success: true,
        data: message,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/message/stream',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: realtimeMessageStreamMock,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/message/statistics',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: messageListResponseMock.statistics,
        message: '获取成功',
      };
    },
  },
  
  // AI报告相关路由
  {
    url: '/api/crypto/ai/report/list',
    method: 'GET',
    response: () => {
      return {
        success: true,
        data: reportListResponseMock,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/ai/report/:id',
    method: 'GET',
    response: (params: any) => {
      const report = params.id === 'report-1' ? reportDetailMock : reportsMock.find(r => r.id === params.id);
      return {
        success: true,
        data: report,
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/ai/report/:id/technical-indicators',
    method: 'GET',
    response: (params: any) => {
      if (params.id === 'report-1') {
        return {
          success: true,
          data: reportDetailMock.technicalIndicators,
          message: '获取成功',
        };
      }
      return {
        success: true,
        data: [],
        message: '获取成功',
      };
    },
  },
  {
    url: '/api/crypto/ai/report/:id/recommendations',
    method: 'GET',
    response: (params: any) => {
      if (params.id === 'report-1') {
        return {
          success: true,
          data: reportDetailMock.investmentRecommendations,
          message: '获取成功',
        };
      }
      return {
        success: true,
        data: [],
        message: '获取成功',
      };
    },
  },
  // 审核日志相关路由
  {
    url: '/api/crypto/reviews/logs',
    method: 'GET',
    response: (params: any) => {
      const { reportId, reviewerId, reviewResult, startDate, endDate } = params;
      
      let filteredLogs = [...reviewLogsMock];
      
      // 按报告ID筛选
      if (reportId) {
        filteredLogs = filteredLogs.filter(log => log.reportId === reportId);
      }
      
      // 按审核人ID筛选
      if (reviewerId) {
        filteredLogs = filteredLogs.filter(log => log.reviewerId === Number(reviewerId));
      }
      
      // 按审核结果筛选
      if (reviewResult) {
        filteredLogs = filteredLogs.filter(log => log.reviewResult === reviewResult);
      }
      
      // 按日期范围筛选
      if (startDate && endDate) {
        filteredLogs = filteredLogs.filter(log => {
          const logDate = new Date(log.reviewTime);
          return logDate >= new Date(startDate) && logDate <= new Date(endDate);
        });
      }
      
      return {
        success: true,
        data: filteredLogs,
        total: filteredLogs.length,
        message: '获取成功'
      };
    },
  },
  
  // 消息采集日志相关路由
  {
    url: '/api/crypto/collect/logs',
    method: 'GET',
    response: (params: any) => {
      const { taskDate, collectStatus, startDate, endDate } = params;
      
      let filteredLogs = [...collectLogsMock];
      
      // 按任务日期筛选
      if (taskDate) {
        filteredLogs = filteredLogs.filter(log => log.taskDate === taskDate);
      }
      
      // 按采集状态筛选
      if (collectStatus) {
        filteredLogs = filteredLogs.filter(log => log.collectStatus === collectStatus);
      }
      
      // 按日期范围筛选
      if (startDate && endDate) {
        filteredLogs = filteredLogs.filter(log => {
          const logDate = new Date(log.executeTime);
          return logDate >= new Date(startDate) && logDate <= new Date(endDate);
        });
      }
      
      return {
        success: true,
        data: filteredLogs,
        total: filteredLogs.length,
        message: '获取成功'
      };
    },
  },
  
  // 完整的AI报告表接口（数据库表直接映射）
  {
    url: '/api/crypto/reports/db',
    method: 'GET',
    response: (params: any) => {
      const { reportId, messageId, reportStatus, startDate, endDate } = params;
      
      let filteredReports = [...aiReportsMock];
      
      if (reportId) {
        filteredReports = filteredReports.filter(report => report.id === reportId);
      }
      
      if (messageId) {
        filteredReports = filteredReports.filter(report => report.messageId === messageId);
      }
      
      if (reportStatus) {
        filteredReports = filteredReports.filter(report => report.reportStatus === reportStatus);
      }
      
      if (startDate && endDate) {
        filteredReports = filteredReports.filter(report => {
          const reportDate = new Date(report.reportDate);
          return reportDate >= new Date(startDate) && reportDate <= new Date(endDate);
        });
      }
      
      return {
        success: true,
        data: filteredReports,
        total: filteredReports.length,
        message: '获取成功'
      };
    },
  },
  
  // 报告详情带关联数据
  {
    url: '/api/crypto/reports/db/:id',
    method: 'GET',
    response: (params: any) => {
      const { id } = params;
      const report = reportsWithRelationsMock.find(r => r.id === id);
      
      if (report) {
        return {
          success: true,
          data: report,
          message: '获取成功'
        };
      } else {
        return {
          success: false,
          message: '报告不存在'
        };
      }
    },
  },
  
  // 审核流程完整数据接口
  {
    url: '/api/crypto/reviews/process/:reportId',
    method: 'GET',
    response: (params: any) => {
      const { reportId } = params;
      const report = aiReportsMock.find(r => r.id === reportId);
      
      if (!report) {
        return {
          success: false,
          message: '报告不存在'
        };
      }
      
      const message = messagesMock.find(m => m.id === report.messageId);
      const logs = reviewLogsMock.filter(log => log.reportId === reportId);
      let positionSnapshot = [];
      
      try {
        positionSnapshot = JSON.parse(report.positionSnapshot) || [];
      } catch (e) {
        positionSnapshot = [];
      }
      
      return {
        success: true,
        data: {
          report,
          message,
          reviewLogs: logs,
          positionSnapshot
        },
        message: '获取成功'
      };
    },
  },
  
  // 消息处理流程完整数据接口
  {
    url: '/api/crypto/messages/process/:messageId',
    method: 'GET',
    response: (params: any) => {
      const { messageId } = params;
      const message = messagesMock.find(m => m.id === messageId);
      
      if (!message) {
        return {
          success: false,
          message: '消息不存在'
        };
      }
      
      // 查找最新的采集日志
      const latestCollectLog = [...collectLogsMock].sort((a, b) =>
        new Date(b.executeTime).getTime() - new Date(a.executeTime).getTime()
      )[0];
      
      const reports = aiReportsMock.filter(report => report.messageId === messageId);
      
      return {
        success: true,
        data: {
          message,
          collectLog: latestCollectLog,
          reports
        },
        message: '获取成功'
      };
    },
  },
  
  // 综合统计分析接口
  {
    url: '/api/crypto/stats/overview',
    method: 'GET',
    response: () => {
      const stats = {
        totalMessages: messagesMock.length,
        totalReports: aiReportsMock.length,
        approvedReports: aiReportsMock.filter(r => r.reportStatus === 'APPROVED').length,
        pendingReports: aiReportsMock.filter(r => r.reportStatus === 'PENDING').length,
        rejectedReports: aiReportsMock.filter(r => r.reportStatus === 'REJECTED').length,
        totalReviewLogs: reviewLogsMock.length,
        successfulCollects: collectLogsMock.filter(log => log.collectStatus === 'SUCCESS').length,
        failedCollects: collectLogsMock.filter(log => log.collectStatus === 'FAILED').length,
        totalCoins: [...new Set(positionsMock.map(p => p.coinType))].length,
        totalPortfolioValue: positionsMock.reduce((sum, pos) => sum + pos.usdValue, 0)
      };
      
      return {
        success: true,
        data: stats,
        message: '获取成功'
      };
    },
  },
  
  // 持仓历史记录相关路由
  {
    url: '/api/crypto/positions/history',
    method: 'GET',
    response: (params: any) => {
      const { coinType, startDate, endDate, limit = 100 } = params;
      
      let filteredHistory = [...positionHistoryMock];
      
      // 按币种筛选
      if (coinType) {
        filteredHistory = filteredHistory.filter(item => item.coinType === coinType);
      }
      
      // 按日期范围筛选
      if (startDate && endDate) {
        filteredHistory = filteredHistory.filter(item => {
          const itemDate = new Date(item.snapshotDate);
          return itemDate >= new Date(startDate) && itemDate <= new Date(endDate);
        });
      }
      
      // 限制返回数量
      filteredHistory = filteredHistory.slice(0, Number(limit));
      
      return {
        success: true,
        data: filteredHistory,
        total: filteredHistory.length,
        message: '获取成功'
      };
    },
  },
  
  // 获取特定币种的持仓历史记录
  {
    url: '/api/crypto/positions/:symbol/history',
    method: 'GET',
    response: (params: any) => {
      const { symbol } = params;
      const { startDate, endDate, limit = 100 } = params;
      
      let filteredHistory = positionHistoryMock.filter(item => item.coinType === symbol);
      
      // 按日期范围筛选
      if (startDate && endDate) {
        filteredHistory = filteredHistory.filter(item => {
          const itemDate = new Date(item.snapshotDate);
          return itemDate >= new Date(startDate) && itemDate <= new Date(endDate);
        });
      }
      
      // 限制返回数量
      filteredHistory = filteredHistory.slice(0, Number(limit));
      
      return {
        success: true,
        data: filteredHistory,
        total: filteredHistory.length,
        coinType: symbol,
        message: '获取成功'
      };
    },
  }
]);