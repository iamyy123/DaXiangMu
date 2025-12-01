/**
 * 系统概览页
 * 展示：未读消息数、待审核报告数、当前总资产估值
 */
import { PageContainer } from '@ant-design/pro-components';
import { Card, Row, Col, Statistic, Button, Space } from 'antd';
import { MessageOutlined, FileTextOutlined, DollarOutlined, ArrowRightOutlined } from '@ant-design/icons';
import { useEffect, useState } from 'react';
import { useNavigate } from '@umijs/max';
import { getOverview } from '@/services/crypto/overview';

const Overview: React.FC = () => {
  const navigate = useNavigate();
  const [overviewData, setOverviewData] = useState({
    unreadMessageCount: 0,
    pendingReportCount: 0,
    totalAssetValue: 0,
  });

  useEffect(() => {
    loadOverview();
    // 每30秒刷新一次数据
    const interval = setInterval(loadOverview, 30000);
    return () => clearInterval(interval);
  }, []);

  const loadOverview = async () => {
    try {
      const response = await getOverview();
      if (response.code === 200) {
        setOverviewData(response.data);
      }
    } catch (error) {
      console.error('加载概览数据失败:', error);
    }
  };

  return (
    <PageContainer title="系统概览">
      <Row gutter={[16, 16]}>
        <Col xs={24} sm={12} lg={8}>
          <Card
            hoverable
            actions={[
              <Button
                key="view"
                type="link"
                icon={<ArrowRightOutlined />}
                onClick={() => navigate('/crypto/message')}
              >
                查看详情
              </Button>,
            ]}
          >
            <Statistic
              title="未读消息数"
              value={overviewData.unreadMessageCount}
              prefix={<MessageOutlined />}
              valueStyle={{ color: '#1890ff' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={8}>
          <Card
            hoverable
            actions={[
              <Button
                key="view"
                type="link"
                icon={<ArrowRightOutlined />}
                onClick={() => navigate('/crypto/report')}
              >
                查看详情
              </Button>,
            ]}
          >
            <Statistic
              title="待审核报告数"
              value={overviewData.pendingReportCount}
              prefix={<FileTextOutlined />}
              valueStyle={{ color: '#faad14' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={8}>
          <Card
            hoverable
            actions={[
              <Button
                key="view"
                type="link"
                icon={<ArrowRightOutlined />}
                onClick={() => navigate('/crypto/position')}
              >
                查看详情
              </Button>,
            ]}
          >
            <Statistic
              title="当前总资产估值"
              value={overviewData.totalAssetValue}
              prefix={<DollarOutlined />}
              precision={2}
              valueStyle={{ color: '#52c41a' }}
            />
          </Card>
        </Col>
      </Row>
      
      <Row gutter={[16, 16]} style={{ marginTop: 16 }}>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/message')}
            style={{ cursor: 'pointer', textAlign: 'center' }}
          >
            <MessageOutlined style={{ fontSize: 48, color: '#1890ff', marginBottom: 16 }} />
            <div style={{ fontSize: 16, fontWeight: 'bold' }}>消息列表</div>
            <div style={{ color: '#999', marginTop: 8 }}>查看所有数字货币消息</div>
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/position')}
            style={{ cursor: 'pointer', textAlign: 'center' }}
          >
            <DollarOutlined style={{ fontSize: 48, color: '#52c41a', marginBottom: 16 }} />
            <div style={{ fontSize: 16, fontWeight: 'bold' }}>持仓数据</div>
            <div style={{ color: '#999', marginTop: 8 }}>查看当前持仓和变化趋势</div>
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/report')}
            style={{ cursor: 'pointer', textAlign: 'center' }}
          >
            <FileTextOutlined style={{ fontSize: 48, color: '#faad14', marginBottom: 16 }} />
            <div style={{ fontSize: 16, fontWeight: 'bold' }}>建议报告</div>
            <div style={{ color: '#999', marginTop: 8 }}>查看AI分析报告并审核</div>
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/overview')}
            style={{ cursor: 'pointer', textAlign: 'center' }}
          >
            <ArrowRightOutlined style={{ fontSize: 48, color: '#722ed1', marginBottom: 16 }} />
            <div style={{ fontSize: 16, fontWeight: 'bold' }}>系统概览</div>
            <div style={{ color: '#999', marginTop: 8 }}>查看系统整体情况</div>
          </Card>
        </Col>
      </Row>
    </PageContainer>
  );
};

export default Overview;

