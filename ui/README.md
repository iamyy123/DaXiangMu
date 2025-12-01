
# 加密货币交易平台

这是一个功能完善的加密货币交易平台前端应用，提供市场概览、持仓管理、市场消息和AI报告等核心功能。

## 功能特性

### 市场概览
- 实时市场数据监控，包括价格、交易量、涨跌幅等核心指标
- 投资组合分析，展示资产分布和风险评估
- AI驱动的市场洞察，提供趋势预测和投资建议

### 持仓管理
- 当前持仓状态和详情展示
- 持仓历史记录追踪
- 盈亏分析，包括日/周/月/年盈亏统计
- 风险评估和预警
- 交易记录管理和导出

### 市场消息
- 实时市场动态和新闻推送
- 消息重要性分级和分类管理
- AI驱动的消息影响分析
- 消息统计和趋势可视化

### AI报告
- 定期市场分析报告生成
- 投资建议和风险评估
- 技术指标深度分析
- 报告审核和管理流程

## 技术栈

- React
- TypeScript
- Redux/Context API
- React Router
- Axios
- vite-plugin-mock-dev-server

## 快速开始

### 安装依赖

```bash
npm install --verbose
# 或者
pnpm install
```

### 开发模式

```bash
npm run dev
# 或者
pnpm run dev
```

### 构建生产版本

```bash
npm run build
```

### 预览生产版本

```bash
npm run preview
```

## 项目结构

```
src/
├── components/    # React组件
├── services/      # API服务（crypto相关服务已完善）
├── types/         # TypeScript类型定义（crypto相关类型已完善）
├── mock/          # Mock数据（已创建完整的模拟数据）
├── utils/         # 工具函数
├── hooks/         # 自定义hooks
├── assets/        # 静态资源
└── App.tsx        # 应用入口
```

## 核心模块

### 服务模块 (src/services/crypto/)
- `overview.ts`: 市场概览服务
- `position.ts`: 持仓管理服务（已完善）
- `message.ts`: 市场消息服务（已完善）
- `report.ts`: AI报告服务（已完善）

### 类型定义 (src/types/crypto/)
- `overview.ts`: 市场概览类型
- `position.ts`: 持仓管理类型（已完善）
- `message.ts`: 市场消息类型（已完善）
- `report.ts`: AI报告类型（已完善）

## 文档

详细的系统文档可以在 `docs/system-overview.md` 中找到，包含：
- 系统概述
- 核心模块详解
- 数据结构定义
- API接口说明
- Mock数据说明

## Mock数据

系统使用Mock数据进行开发和测试，Mock配置位于：
- `src/mock/cryptoMock.ts` - 包含所有模块的Mock数据定义
- `src/mock/route.ts` - 配置了所有API路由的Mock响应

## 注意事项

- 开发环境下使用Mock数据，生产环境需要配置真实API
- 确保安装了所有依赖后再启动开发服务器
- 支持现代浏览器，建议使用Chrome、Firefox等最新版本
- 项目已包含完整的TypeScript类型定义，建议使用TypeScript友好的编辑器