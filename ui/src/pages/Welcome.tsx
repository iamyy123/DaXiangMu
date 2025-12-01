import React from 'react';
import { useModel, Link } from '@umijs/max';
import { Card, theme, Row, Col, Typography, Statistic } from 'antd';
import { TrendingUpOutlined, PieChartOutlined, AlertOutlined } from '@ant-design/icons';
// 从正确的包导入PageContainer
import { PageContainer } from '@ant-design/pro-components';

const { Title, Paragraph, Text } = Typography;

/**
 * 投资系统功能卡片组件
 */
interface InvestmentCardProps {
  title: string;
  icon: React.ReactNode;
  description: string;
  href: string;
  color: string;
  type?: 'primary' | 'default';
}

const InvestmentCard: React.FC<InvestmentCardProps> = ({
  title = '',
  icon = null,
  description = '',
  href = '/',
  color = '#1890ff',
  type = 'default',
}) => {
  const { token } = theme.useToken();
  const renderIcon = icon || <AlertOutlined />;

  return (
    <Link to={href} style={{ color: 'inherit', textDecoration: 'none', display: 'block', height: '100%' }}>
      <Card
        hoverable
        bordered={false}
        style={{
          height: '100%',
          borderRadius: 12,
          transition: 'all 0.3s ease',
          boxShadow: type === 'primary'
            ? `0 8px 20px rgba(0, 0, 0, 0.15)`
            : '0 4px 12px rgba(0, 0, 0, 0.08)',
          overflow: 'hidden',
        }}
        bodyStyle={{
          padding: 24,
          display: 'flex',
          flexDirection: 'column',
          height: '100%',
        }}
      >
        <div
          style={{
            width: 64,
            height: 64,
            borderRadius: 8,
            backgroundColor: `${color}15`,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            marginBottom: 16,
          }}
        >
          <div style={{ color, fontSize: 28 }}>
            {renderIcon}
          </div>
        </div>
        <Title level={4} style={{ margin: 0, marginBottom: 8, fontWeight: 600 }}>
          {title}
        </Title>
        <Paragraph
          style={{
            margin: 0,
            color: token.colorTextSecondary,
            fontSize: 14,
            lineHeight: 1.6,
            flex: 1,
          }}
        >
          {description}
        </Paragraph>
        <div style={{ marginTop: 16 }}>
          <Text
            style={{
              color,
              fontSize: 14,
              fontWeight: 500,
            }}
          >
            立即开始 <TrendingUpOutlined style={{ fontSize: 12, marginLeft: 4 }} />
          </Text>
        </div>
      </Card>
    </Link>
  );
};

const Welcome: React.FC = () => {
  const { token } = theme.useToken();
  const { initialState } = useModel('@@initialState');

  // 修复：用三元表达式替代 || 语法，JSX 仅支持合法组件标签
  const Container = PageContainer || 'div';

  if (!initialState) {
    return (
      <div style={{ padding: 24, textAlign: 'center' }}>
        <Text>加载中...</Text>
      </div>
    );
  }

  return (
    // 正确写法：使用变量接收组件，再渲染
    <Container>
      <div style={{ padding: 24, backgroundColor: token.colorBgLayout }}>
        {/* 页面标题区域 */}
        <div style={{ marginBottom: 24, textAlign: 'center' }}>
          <Title level={1} style={{ margin: 0, marginBottom: 8, fontWeight: 600 }}>
            AI驱动数字货币投资辅助系统
          </Title>
          <Paragraph
            style={{
              margin: 0,
              color: token.colorTextSecondary,
              fontSize: 16,
              maxWidth: 800,
              marginLeft: 'auto',
              marginRight: 'auto',
            }}
          >
            利用人工智能技术为您的数字货币投资决策提供数据支持和智能分析，助力您在波动的市场中把握机遇
          </Paragraph>
        </div>

        {/* 统计卡片区域 */}
        <Row gutter={[24, 24]} style={{ marginBottom: 32 }}>
          <Col xs={24} sm={24} md={8} lg={8} xl={8}>
            <Card
              bordered={false}
              style={{
                borderRadius: 12,
                boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
              }}
              bodyStyle={{ padding: 24 }}
            >
              <Statistic
                title="市场监控币种数"
                value={156}
                suffix="种"
                valueStyle={{ color: '#1890ff' }}
                prefix={<TrendingUpOutlined />}
              />
            </Card>
          </Col>
          <Col xs={24} sm={24} md={8} lg={8} xl={8}>
            <Card
              bordered={false}
              style={{
                borderRadius: 12,
                boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
              }}
              bodyStyle={{ padding: 24 }}
            >
              <Statistic
                title="AI分析准确率"
                value={87.6}
                suffix="%"
                valueStyle={{ color: '#52c41a' }}
                prefix={<AlertOutlined />}
              />
            </Card>
          </Col>
          <Col xs={24} sm={24} md={8} lg={8} xl={8}>
            <Card
              bordered={false}
              style={{
                borderRadius: 12,
                boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
              }}
              bodyStyle={{ padding: 24 }}
            >
              <Statistic
                title="用户投资组合数"
                value={2583}
                suffix="个"
                valueStyle={{ color: '#faad14' }}
                prefix={<PieChartOutlined />}
              />
            </Card>
          </Col>
        </Row>

        {/* 核心功能区域 */}
        <Row gutter={[24, 24]}>
          <Col xs={24} sm={24} md={12} lg={12} xl={12}>
            <InvestmentCard
              title="AI驱动分析系统"
              icon={<AlertOutlined />}
              description="通过机器学习算法分析市场趋势，识别潜在投资机会，提供智能预警和风险评估"
              href="/crypto/analysis"
              color="#1890ff"
              type="primary"
            />
          </Col>
          <Col xs={24} sm={24} md={12} lg={12} xl={12}>
            <InvestmentCard
              title="投资组合管理"
              icon={<PieChartOutlined />}
              description="管理您的数字货币投资组合，追踪持仓表现，分析盈亏状况，优化资产配置"
              href="/crypto/position"
              color="#52c41a"
              type="primary"
            />
          </Col>
        </Row>

        {/* 底部区域 */}
        <div style={{ marginTop: 48, paddingTop: 24, borderTop: `1px solid ${token.colorBorder}` }}>
          <Paragraph style={{ textAlign: 'center', color: token.colorTextSecondary, fontSize: 14 }}>
            AI驱动数字货币投资辅助系统 - 为您的投资决策提供智能支持
          </Paragraph>
        </div>
      </div>
    </Container>
  );
};

// 导出组件（兼容默认导入和命名导入）
export default Welcome;
export { InvestmentCard };