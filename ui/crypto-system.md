# AI驱动数字货币投资辅助系统

## 项目概述

本项目是一个基于AI驱动的数字货币投资辅助系统，为用户提供全面的加密货币市场分析、投资组合管理和AI报告服务。系统包含多个核心模块，支持市场概览、消息推送、AI分析报告和持仓管理等功能。

## 已完成工作

### 1. 类型定义文件

已在 `src/types/crypto/` 目录下创建了完整的TypeScript类型定义：

- **overview.ts**: 系统概览数据结构定义
- **position.ts**: 持仓相关数据结构定义
- **message.ts**: 市场消息数据结构定义
- **report.ts**: AI分析报告数据结构定义

### 2. 服务接口

已完善 `src/services/crypto/` 目录下的所有API服务：

- **overview.ts**: 获取系统概览数据
- **position.ts**: 持仓查询和管理接口
- **message.ts**: 市场消息查询和收藏接口
- **report.ts**: AI报告查询和审核接口

### 3. Mock数据

已创建完整的模拟数据系统：

- **mock/cryptoMock.ts**: 包含所有API端点的模拟数据
- **mock/route.ts**: 已配置mock数据路由，确保开发环境可以正常访问模拟数据

## 核心功能模块

### 1. 市场概览（Overview）

- 实时市场数据展示
- 投资组合总体表现
- AI洞察分析
- 风险评估报告
- 市场趋势图表

### 2. 持仓管理（Position）

- 当前持仓实时监控
- 盈亏分析和风险评估
- 历史持仓记录查询
- 持仓数据导出功能
- AI持仓建议

### 3. 市场消息（Message）

- 实时市场动态推送
- 消息重要性分级
- AI消息影响分析
- 消息收藏功能
- 相关消息推荐

### 4. AI报告（Report）

- 定期市场分析报告
- AI投资建议
- 技术指标分析
- 基本面分析
- 市场预测
- 报告审核功能

## 使用说明

### 本地开发

1. 确保已安装所有依赖：
   ```bash
   pnpm install
   ```

2. 启动开发服务器：
   ```bash
   pnpm start
   ```

3. 访问系统页面：
   - 市场概览: `/crypto/overview`
   - 持仓管理: `/crypto/position`
   - 市场消息: `/crypto/message`
   - AI报告: `/crypto/report`

### Mock数据说明

系统已配置完整的mock数据，在开发环境下无需后端服务即可正常运行。Mock数据包含：

- 10种主流加密货币的模拟数据
- 丰富的市场消息和分析报告
- 完整的持仓历史记录
- 实时更新的市场概览数据

## 数据结构示例

### 市场概览数据

```typescript
interface CryptoOverview {
  marketOverview: { /* 市场总览数据 */ };
  keyMetrics: { /* 关键指标 */ };
  portfolioOverview: { /* 投资组合概览 */ };
  riskAssessment: { /* 风险评估 */ };
  aiInsights: { /* AI洞察 */ };
  recentActivities: { /* 最近活动 */ }[];
  chartData: { /* 图表数据 */ };
  systemStatus: { /* 系统状态 */ };
}
```

### 持仓数据

```typescript
interface PositionItem {
  symbol: string; // 加密货币符号
  currentPrice: number; // 当前价格
  holdingAmount: number; // 持仓数量
  totalValue: number; // 总价值
  profitLoss: number; // 盈亏金额
  profitLossRate: number; // 盈亏比例
  riskLevel: 'low' | 'medium' | 'high'; // 风险等级
  aiAnalysis: string; // AI分析
}
```

## 注意事项

1. 本系统使用TypeScript进行开发，确保代码质量和类型安全
2. Mock数据仅用于开发和测试环境，生产环境需要连接真实后端API
3. 所有数据接口都支持分页、筛选和排序功能
4. AI分析功能基于模拟数据，实际效果取决于后端AI模型质量

## 后续优化方向

1. 增强AI预测模型的准确性
2. 添加更多技术指标分析
3. 实现实时市场数据推送
4. 支持更多加密货币和交易对
5. 增强风险评估算法

---

本系统提供完整的数字货币投资辅助功能，帮助用户做出更明智的投资决策。