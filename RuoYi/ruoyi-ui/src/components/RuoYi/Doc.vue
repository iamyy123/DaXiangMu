/**
 * 主页面 - 数字货币投资辅助系统
 * 移除支付二维码及支持相关内容，保留核心功能和系统信息
 */
import { PageContainer } from '@ant-design/pro-components';
import { Card, Row, Col, Statistic, Button, Typography, Tag, Divider, List, Space } from 'antd';
import { 
  MessageOutlined, FileTextOutlined, DollarOutlined, ArrowRightOutlined,
  CloudOutlined, HomeOutlined, UserOutlined, GithubOutlined 
} from '@ant-design/icons';
import { useEffect, useState } from 'react';
import { useNavigate } from '@umijs/max';
import { getOverview } from '@/services/crypto/overview';

const { Title, Text, Paragraph } = Typography;

const HomePage: React.FC = () => {
  const navigate = useNavigate();
  const [overviewData, setOverviewData] = useState({
    unreadMessageCount: 0,
    pendingReportCount: 0,
    totalAssetValue: 0,
  });

  // 系统版本信息
  const version = "3.9.0";

  // 加载概览统计数据
  useEffect(() => {
    loadOverview();
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

  // 打开外部链接
  const goTarget = (href: string) => {
    window.open(href, "_blank");
  };

  // 技术选型数据
  const backendTech = [
    'SpringBoot', 'Spring Security', 'JWT', 'MyBatis', 'Druid', 'Fastjson', '...'
  ];
  const frontendTech = [
    'Vue', 'Vuex', 'Element-ui', 'Axios', 'Sass', 'Quill', '...'
  ];

  // 更新日志数据
  const updateLogs = [
    '前后端分离系统',
    '新增AI分析报告功能',
    '优化持仓数据统计',
    '支持数字货币消息实时推送'
  ];

  return (
    <PageContainer title="AI驱动数字货币投资辅助系统">
      {/* 顶部统计卡片区域 */}
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

      {/* 功能入口卡片区域 */}
      <Row gutter={[16, 16]} style={{ marginTop: 16 }}>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/message')}
            style={{ cursor: 'pointer', textAlign: 'center', padding: '24px 0' }}
          >
            <MessageOutlined style={{ fontSize: 48, color: '#1890ff', marginBottom: 16 }} />
            <Title level={5} style={{ margin: 0 }}>消息列表</Title>
            <Text type="secondary" style={{ display: 'block', marginTop: 8 }}>
              查看所有数字货币消息
            </Text>
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/position')}
            style={{ cursor: 'pointer', textAlign: 'center', padding: '24px 0' }}
          >
            <DollarOutlined style={{ fontSize: 48, color: '#52c41a', marginBottom: 16 }} />
            <Title level={5} style={{ margin: 0 }}>持仓数据</Title>
            <Text type="secondary" style={{ display: 'block', marginTop: 8 }}>
              查看当前持仓和变化趋势
            </Text>
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/report')}
            style={{ cursor: 'pointer', textAlign: 'center', padding: '24px 0' }}
          >
            <FileTextOutlined style={{ fontSize: 48, color: '#faad14', marginBottom: 16 }} />
            <Title level={5} style={{ margin: 0 }}>建议报告</Title>
            <Text type="secondary" style={{ display: 'block', marginTop: 8 }}>
              查看AI分析报告并审核
            </Text>
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card
            hoverable
            onClick={() => navigate('/crypto/overview')}
            style={{ cursor: 'pointer', textAlign: 'center', padding: '24px 0' }}
          >
            <ArrowRightOutlined style={{ fontSize: 48, color: '#722ed1', marginBottom: 16 }} />
            <Title level={5} style={{ margin: 0 }}>系统概览</Title>
            <Text type="secondary" style={{ display: 'block', marginTop: 8 }}>
              查看系统整体情况
            </Text>
          </Card>
        </Col>
      </Row>

      <Divider style={{ margin: '24px 0' }} />

      {/* 系统信息和技术选型区域 */}
      <Row gutter={[40, 20]} style={{ marginBottom: 24 }}>
        <Col xs={24} lg={11}>
          <Title level={2} style={{ fontSize: 26, fontWeight: 400, marginBottom: 16 }}>
            AI驱动数字货币投资辅助系统
          </Title>
          <Paragraph style={{ fontSize: 16, color: '#666' }}>
            一款后台管理系统，可以用于Web应用程序
          </Paragraph>
          <Paragraph style={{ fontSize: 16, color: '#666' }}>
            <strong>当前版本:</strong> <span>v{version}</span>
          </Paragraph>
          <Space size="middle" style={{ marginBottom: 16 }}>
            <Tag color="red">免费开源</Tag>
          </Space>
          <Space size="middle">
            <Button
              type="primary"
              size="middle"
              icon={<CloudOutlined />}
              ghost
              onClick={() => goTarget('https://gitee.com/y_project/RuoYi-Vue')}
            >
              访问码云
            </Button>
            <Button
              size="middle"
              icon={<HomeOutlined />}
              ghost
              onClick={() => goTarget('http://ruoyi.vip')}
            >
              访问主页
            </Button>
          </Space>
        </Col>

        <Col xs={24} lg={13}>
          <Title level={2} style={{ fontSize: 26, fontWeight: 400, marginBottom: 16 }}>
            技术选型
          </Title>
          <Row gutter={[30, 10]}>
            <Col xs={24} sm={12}>
              <Title level={4} style={{ marginBottom: 12 }}>后端技术</Title>
              <List
                dataSource={backendTech}
                renderItem={(item) => (
                  <List.Item style={{ padding: '4px 0' }}>
                    <Text>{item}</Text>
                  </List.Item>
                )}
              />
            </Col>
            <Col xs={24} sm={12}>
              <Title level={4} style={{ marginBottom: 12 }}>前端技术</Title>
              <List
                dataSource={frontendTech}
                renderItem={(item) => (
                  <List.Item style={{ padding: '4px 0' }}>
                    <Text>{item}</Text>
                  </List.Item>
                )}
              />
            </Col>
          </Row>
        </Col>
      </Row>

      <Divider style={{ margin: '24px 0' }} />

      {/* 联系信息、更新日志区域（删除支付相关内容） */}
      <Row gutter={[16, 16]}>
        <Col xs={24} sm={24} md={12} lg={12}>
          <Card title="联系信息" hoverable>
            <List
              dataSource={[
                { icon: <UserOutlined />, text: 'QQ：1234567' },
                { icon: <GithubOutlined />, text: 'Github：@ruoyi-vue' }
              ]}
              renderItem={(item) => (
                <List.Item>
                  <Space size="small">
                    {item.icon}
                    <Text>{item.text}</Text>
                  </Space>
                </List.Item>
              )}
            />
          </Card>
        </Col>
        <Col xs={24} sm={24} md={12} lg={12}>
          <Card title="更新日志" hoverable>
            <List
              dataSource={updateLogs}
              renderItem={(item, index) => (
                <List.Item>
                  <Text>
                    {index + 1}. {item}
                  </Text>
                </List.Item>
              )}
            />
          </Card>
        </Col>
      </Row>
    </PageContainer>
  );
};

export default HomePage;