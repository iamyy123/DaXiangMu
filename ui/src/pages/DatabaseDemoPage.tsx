// 数据库数据展示示例页面
// 展示所有数据库表的数据功能

import React, { useState, useEffect } from 'react';
import { Tabs, Card, Table, Select, DatePicker, Input, Button, Row, Col, Statistic, Tag, Badge, Avatar, Empty, Spin } from 'antd';
import { BarChartOutlined, DatabaseOutlined, MessageOutlined, PieChartOutlined, TrendingUpOutlined, UserOutlined, FileSearchOutlined, ClockCircleOutlined } from '@ant-design/icons';
import cryptoService from '../services/cryptoService';
import { CryptoMessage, CryptoPosition, CryptoPositionHistory, CryptoAIReport, CryptoReviewLog, CryptoCollectLog } from '../types/crypto/database';

const { TabPane } = Tabs;
const { Option } = Select;
const { RangePicker } = DatePicker;
const { Search } = Input;

const DatabaseDemoPage: React.FC = () => {
  // 状态管理
  const [loading, setLoading] = useState<boolean>(false);
  const [activeTab, setActiveTab] = useState<string>('overview');
  const [stats, setStats] = useState<any>(null);
  
  // 消息相关状态
  const [messages, setMessages] = useState<CryptoMessage[]>([]);
  const [messagesFilter, setMessagesFilter] = useState({
    coinType: '',
    sentiment: '',
    dateRange: [] as any[],
  });
  
  // 持仓相关状态
  const [positions, setPositions] = useState<CryptoPosition[]>([]);
  const [positionHistory, setPositionHistory] = useState<CryptoPositionHistory[]>([]);
  const [historyFilter, setHistoryFilter] = useState({
    coinType: '',
    dateRange: [] as any[],
  });
  
  // 报告相关状态
  const [reports, setReports] = useState<CryptoAIReport[]>([]);
  const [reportsFilter, setReportsFilter] = useState({
    reportStatus: '',
    dateRange: [] as any[],
  });
  
  // 审核日志相关状态
  const [reviewLogs, setReviewLogs] = useState<CryptoReviewLog[]>([]);
  const [logsFilter, setLogsFilter] = useState({
    reviewResult: '',
    dateRange: [] as any[],
  });
  
  // 采集日志相关状态
  const [collectLogs, setCollectLogs] = useState<CryptoCollectLog[]>([]);
  const [collectFilter, setCollectFilter] = useState({
    collectStatus: '',
    dateRange: [] as any[],
  });

  // 获取统计概览数据
  useEffect(() => {
    loadOverviewStatistics();
  }, []);

  // 加载统计概览
  const loadOverviewStatistics = async () => {
    try {
      const data = await cryptoService.statistics.getOverviewStatistics();
      setStats(data);
    } catch (error) {
      console.error('加载统计数据失败:', error);
    }
  };

  // 加载消息数据
  const loadMessages = async () => {
    setLoading(true);
    try {
      const params: any = {};
      if (messagesFilter.coinType) params.coinType = messagesFilter.coinType;
      if (messagesFilter.sentiment) params.sentiment = messagesFilter.sentiment;
      if (messagesFilter.dateRange.length > 0) {
        params.startDate = messagesFilter.dateRange[0].format('YYYY-MM-DD');
        params.endDate = messagesFilter.dateRange[1].format('YYYY-MM-DD');
      }
      
      // 使用通用消息接口，因为我们没有特定的数据库消息接口实现
      const response = await cryptoService.message.getMessages(params);
      // 转换为数据库消息格式
      const dbMessages = response.items.map((msg: any) => ({
        id: msg.id,
        coinType: msg.coinType,
        title: msg.title,
        content: msg.content,
        source: msg.source,
        sourceUrl: msg.sourceUrl,
        sentiment: msg.sentiment === 'positive' ? '利好' : msg.sentiment === 'negative' ? '利空' : '中性',
        impactLevel: msg.impactLevel,
        collectTime: msg.publishTime,
        status: 1
      }));
      setMessages(dbMessages);
    } catch (error) {
      console.error('加载消息数据失败:', error);
    } finally {
      setLoading(false);
    }
  };

  // 加载持仓数据
  const loadPositions = async () => {
    setLoading(true);
    try {
      const positionsData = await cryptoService.position.getPositions();
      // 转换为数据库格式
      const dbPositions = positionsData.map((pos: any) => ({
        id: pos.id,
        coinType: pos.coinType,
        amount: pos.amount,
        percentage: pos.percentage,
        usdValue: pos.usdValue,
        price: pos.price,
        snapshotDate: new Date().toISOString().split('T')[0],
        updateTime: new Date().toISOString()
      }));
      setPositions(dbPositions);
    } catch (error) {
      console.error('加载持仓数据失败:', error);
    } finally {
      setLoading(false);
    }
  };

  // 加载持仓历史数据
  const loadPositionHistory = async () => {
    setLoading(true);
    try {
      const params: any = {};
      if (historyFilter.coinType) params.coinType = historyFilter.coinType;
      if (historyFilter.dateRange.length > 0) {
        params.startDate = historyFilter.dateRange[0].format('YYYY-MM-DD');
        params.endDate = historyFilter.dateRange[1].format('YYYY-MM-DD');
      }
      
      const historyData = await cryptoService.position.getPositionHistory(params);
      setPositionHistory(historyData.data);
    } catch (error) {
      console.error('加载持仓历史数据失败:', error);
    } finally {
      setLoading(false);
    }
  };

  // 加载报告数据
  const loadReports = async () => {
    setLoading(true);
    try {
      // 使用报告服务获取数据
      const reportsData = await cryptoService.report.getReportsFromDb(reportsFilter.reportStatus ? { reportStatus: reportsFilter.reportStatus } : undefined);
      setReports(reportsData);
    } catch (error) {
      console.error('加载报告数据失败:', error);
    } finally {
      setLoading(false);
    }
  };

  // 加载审核日志数据
  const loadReviewLogs = async () => {
    setLoading(true);
    try {
      const logsData = await cryptoService.review.getReviewLogs(logsFilter.reviewResult ? { reviewResult: logsFilter.reviewResult } : undefined);
      setReviewLogs(logsData.data);
    } catch (error) {
      console.error('加载审核日志数据失败:', error);
    } finally {
      setLoading(false);
    }
  };

  // 加载采集日志数据
  const loadCollectLogs = async () => {
    setLoading(true);
    try {
      const logsData = await cryptoService.collectLog.getCollectLogs(collectFilter.collectStatus ? { collectStatus: collectFilter.collectStatus } : undefined);
      setCollectLogs(logsData.data);
    } catch (error) {
      console.error('加载采集日志数据失败:', error);
    } finally {
      setLoading(false);
    }
  };

  // 标签颜色映射
  const getStatusColor = (status: string) => {
    const colorMap: { [key: string]: string } = {
      'APPROVED': 'green',
      'REJECTED': 'red',
      'PENDING': 'orange',
      'SUCCESS': 'green',
      'FAILED': 'red',
      '利好': 'green',
      '利空': 'red',
      '中性': 'blue',
    };
    return colorMap[status] || 'default';
  };

  // 标签文本映射
  const getStatusText = (status: string) => {
    const textMap: { [key: string]: string } = {
      'APPROVED': '已通过',
      'REJECTED': '已驳回',
      'PENDING': '待审核',
      'SUCCESS': '成功',
      'FAILED': '失败',
    };
    return textMap[status] || status;
  };

  // 统计卡片组件
  const StatCard = ({ title, value, icon, color }: { title: string; value: any; icon: React.ReactNode; color: string }) => (
    <Card>
      <Row align="middle">
        <Col span={16}>
          <Statistic title={title} value={value} valueStyle={{ color }} />
        </Col>
        <Col span={8} style={{ textAlign: 'right' }}>
          <Badge color={color}>{icon}</Badge>
        </Col>
      </Row>
    </Card>
  );

  // 渲染统计概览面板
  const renderOverviewPanel = () => (
    <div>
      <Row gutter={[16, 16]}>
        <Col xs={24} sm={12} lg={6}>
          <StatCard 
            title="总消息数" 
            value={stats?.totalMessages || 0} 
            icon={<MessageOutlined />} 
            color="#1890ff" 
          />
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <StatCard 
            title="AI报告数" 
            value={stats?.totalReports || 0} 
            icon={<FileSearchOutlined />} 
            color="#52c41a" 
          />
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <StatCard 
            title="审核日志数" 
            value={stats?.totalReviewLogs || 0} 
            icon={<UserOutlined />} 
            color="#faad14" 
          />
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <StatCard 
            title="采集日志数" 
            value={stats?.successfulCollects + (stats?.failedCollects || 0) || 0} 
            icon={<ClockCircleOutlined />} 
            color="#722ed1" 
          />
        </Col>
      </Row>
      
      <Row gutter={[16, 16]} style={{ marginTop: 16 }}>
        <Col span={24}>
          <Card title="报告状态分布" bordered={false}>
            <Row gutter={[16, 16]}>
              <Col xs={24} sm={8}>
                <Statistic 
                  title="已通过" 
                  value={stats?.approvedReports || 0} 
                  valueStyle={{ color: '#52c41a' }} 
                />
              </Col>
              <Col xs={24} sm={8}>
                <Statistic 
                  title="待审核" 
                  value={stats?.pendingReports || 0} 
                  valueStyle={{ color: '#faad14' }} 
                />
              </Col>
              <Col xs={24} sm={8}>
                <Statistic 
                  title="已驳回" 
                  value={stats?.rejectedReports || 0} 
                  valueStyle={{ color: '#ff4d4f' }} 
                />
              </Col>
            </Row>
          </Card>
        </Col>
      </Row>
    </div>
  );

  // 渲染消息面板
  const renderMessagePanel = () => (
    <div>
      <Card title="消息表数据过滤" style={{ marginBottom: 16 }}>
        <Row gutter={[16, 16]} align="middle">
          <Col xs={24} sm={8}>
            <Select 
              placeholder="选择币种" 
              style={{ width: '100%' }}
              onChange={(value) => setMessagesFilter({ ...messagesFilter, coinType: value })}
              allowClear
            >
              <Option value="BTC">BTC</Option>
              <Option value="ETH">ETH</Option>
              <Option value="SOL">SOL</Option>
              <Option value="DOGE">DOGE</Option>
            </Select>
          </Col>
          <Col xs={24} sm={8}>
            <Select 
              placeholder="情感倾向" 
              style={{ width: '100%' }}
              onChange={(value) => setMessagesFilter({ ...messagesFilter, sentiment: value })}
              allowClear
            >
              <Option value="positive">利好</Option>
              <Option value="negative">利空</Option>
              <Option value="neutral">中性</Option>
            </Select>
          </Col>
          <Col xs={24} sm={8}>
            <RangePicker 
              style={{ width: '100%' }}
              onChange={(dates) => setMessagesFilter({ ...messagesFilter, dateRange: dates || [] })}
            />
          </Col>
          <Col xs={24} style={{ textAlign: 'right' }}>
            <Button type="primary" onClick={loadMessages} icon={<SearchOutlined />}>搜索</Button>
          </Col>
        </Row>
      </Card>
      
      <Table 
        columns={[
          { title: 'ID', dataIndex: 'id', key: 'id' },
          { title: '币种', dataIndex: 'coinType', key: 'coinType' },
          { title: '标题', dataIndex: 'title', key: 'title', ellipsis: true },
          { 
            title: '情感', 
            dataIndex: 'sentiment', 
            key: 'sentiment',
            render: (text: string) => <Tag color={getStatusColor(text)}>{text}</Tag>
          },
          { title: '影响等级', dataIndex: 'impactLevel', key: 'impactLevel' },
          { title: '来源', dataIndex: 'source', key: 'source' },
          { title: '采集时间', dataIndex: 'collectTime', key: 'collectTime' },
        ]} 
        dataSource={messages} 
        rowKey="id"
        loading={loading}
        pagination={{ pageSize: 10 }}
        locale={{ emptyText: <Empty description="暂无消息数据" /> }}
      />
    </div>
  );

  // 渲染持仓面板
  const renderPositionPanel = () => (
    <div>
      <Card title="当前持仓信息" style={{ marginBottom: 16 }}>
        {loading ? (
          <Spin size="large" style={{ display: 'flex', justifyContent: 'center', padding: 20 }} />
        ) : (
          <Table 
            columns={[
              { title: '币种', dataIndex: 'coinType', key: 'coinType' },
              { title: '数量', dataIndex: 'amount', key: 'amount' },
              { title: '占比(%)', dataIndex: 'percentage', key: 'percentage' },
              { title: '美元价值', dataIndex: 'usdValue', key: 'usdValue', render: (value: number) => `$${value.toLocaleString()}` },
              { title: '单价(USD)', dataIndex: 'price', key: 'price', render: (value: number) => `$${value.toLocaleString()}` },
            ]} 
            dataSource={positions} 
            rowKey="coinType"
            pagination={false}
            locale={{ emptyText: <Empty description="暂无持仓数据" /> }}
          />
        )}
      </Card>
    </div>
  );

  // 渲染持仓历史面板
  const renderHistoryPanel = () => (
    <div>
      <Card title="持仓历史记录过滤" style={{ marginBottom: 16 }}>
        <Row gutter={[16, 16]} align="middle">
          <Col xs={24} sm={12}>
            <Select 
              placeholder="选择币种" 
              style={{ width: '100%' }}
              onChange={(value) => setHistoryFilter({ ...historyFilter, coinType: value })}
              allowClear
            >
              <Option value="BTC">BTC</Option>
              <Option value="ETH">ETH</Option>
              <Option value="SOL">SOL</Option>
            </Select>
          </Col>
          <Col xs={24} sm={12}>
            <RangePicker 
              style={{ width: '100%' }}
              onChange={(dates) => setHistoryFilter({ ...historyFilter, dateRange: dates || [] })}
            />
          </Col>
          <Col xs={24} style={{ textAlign: 'right' }}>
            <Button type="primary" onClick={loadPositionHistory} icon={<ClockCircleOutlined />}>查看历史</Button>
          </Col>
        </Row>
      </Card>
      
      <Table 
        columns={[
          { title: 'ID', dataIndex: 'id', key: 'id' },
          { title: '币种', dataIndex: 'coinType', key: 'coinType' },
          { title: '数量', dataIndex: 'amount', key: 'amount' },
          { title: '占比(%)', dataIndex: 'percentage', key: 'percentage' },
          { title: '美元价值', dataIndex: 'usdValue', key: 'usdValue', render: (value: number) => `$${value.toLocaleString()}` },
          { title: '单价(USD)', dataIndex: 'price', key: 'price', render: (value: number) => `$${value.toLocaleString()}` },
          { title: '变动类型', dataIndex: 'changeType', key: 'changeType' },
          { title: '变动原因', dataIndex: 'changeReason', key: 'changeReason' },
          { title: '快照日期', dataIndex: 'snapshotDate', key: 'snapshotDate' },
        ]} 
        dataSource={positionHistory} 
        rowKey="id"
        loading={loading}
        pagination={{ pageSize: 10 }}
        locale={{ emptyText: <Empty description="暂无历史数据" /> }}
      />
    </div>
  );

  // 渲染报告面板
  const renderReportPanel = () => (
    <div>
      <Card title="AI分析报告过滤" style={{ marginBottom: 16 }}>
        <Row gutter={[16, 16]} align="middle">
          <Col xs={24} sm={12}>
            <Select 
              placeholder="报告状态" 
              style={{ width: '100%' }}
              onChange={(value) => setReportsFilter({ ...reportsFilter, reportStatus: value })}
              allowClear
            >
              <Option value="PENDING">待审核</Option>
              <Option value="APPROVED">已通过</Option>
              <Option value="REJECTED">已驳回</Option>
            </Select>
          </Col>
          <Col xs={24} sm={12} style={{ textAlign: 'right' }}>
            <Button type="primary" onClick={loadReports} icon={<FileSearchOutlined />}>搜索</Button>
          </Col>
        </Row>
      </Card>
      
      <Table 
        columns={[
          { title: 'ID', dataIndex: 'id', key: 'id' },
          { title: '关联消息ID', dataIndex: 'messageId', key: 'messageId' },
          { 
            title: '状态', 
            dataIndex: 'reportStatus', 
            key: 'reportStatus',
            render: (text: string) => <Tag color={getStatusColor(text)}>{getStatusText(text)}</Tag>
          },
          { title: '报告日期', dataIndex: 'reportDate', key: 'reportDate' },
          { title: 'AI第一次分析', dataIndex: 'firstAnalysis', key: 'firstAnalysis', ellipsis: true },
          { title: 'AI第二次分析', dataIndex: 'secondAnalysis', key: 'secondAnalysis', ellipsis: true },
          { title: '创建时间', dataIndex: 'createTime', key: 'createTime' },
        ]} 
        dataSource={reports} 
        rowKey="id"
        loading={loading}
        pagination={{ pageSize: 10 }}
        locale={{ emptyText: <Empty description="暂无报告数据" /> }}
      />
    </div>
  );

  // 渲染审核日志面板
  const renderReviewLogPanel = () => (
    <div>
      <Card title="审核日志过滤" style={{ marginBottom: 16 }}>
        <Row gutter={[16, 16]} align="middle">
          <Col xs={24} sm={12}>
            <Select 
              placeholder="审核结果" 
              style={{ width: '100%' }}
              onChange={(value) => setLogsFilter({ ...logsFilter, reviewResult: value })}
              allowClear
            >
              <Option value="APPROVED">已通过</Option>
              <Option value="REJECTED">已驳回</Option>
            </Select>
          </Col>
          <Col xs={24} sm={12} style={{ textAlign: 'right' }}>
            <Button type="primary" onClick={loadReviewLogs} icon={<UserOutlined />}>搜索</Button>
          </Col>
        </Row>
      </Card>
      
      <Table 
        columns={[
          { title: 'ID', dataIndex: 'id', key: 'id' },
          { title: '报告ID', dataIndex: 'reportId', key: 'reportId' },
          { title: '审核人', dataIndex: 'reviewerName', key: 'reviewerName' },
          { 
            title: '审核结果', 
            dataIndex: 'reviewResult', 
            key: 'reviewResult',
            render: (text: string) => <Tag color={getStatusColor(text)}>{getStatusText(text)}</Tag>
          },
          { title: '审核意见', dataIndex: 'reviewComment', key: 'reviewComment', ellipsis: true },
          { title: '审核时间', dataIndex: 'reviewTime', key: 'reviewTime' },
        ]} 
        dataSource={reviewLogs} 
        rowKey="id"
        loading={loading}
        pagination={{ pageSize: 10 }}
        locale={{ emptyText: <Empty description="暂无审核日志" /> }}
      />
    </div>
  );

  // 渲染采集日志面板
  const renderCollectLogPanel = () => (
    <div>
      <Card title="消息采集日志过滤" style={{ marginBottom: 16 }}>
        <Row gutter={[16, 16]} align="middle">
          <Col xs={24} sm={12}>
            <Select 
              placeholder="采集状态" 
              style={{ width: '100%' }}
              onChange={(value) => setCollectFilter({ ...collectFilter, collectStatus: value })}
              allowClear
            >
              <Option value="SUCCESS">成功</Option>
              <Option value="FAILED">失败</Option>
            </Select>
          </Col>
          <Col xs={24} sm={12} style={{ textAlign: 'right' }}>
            <Button type="primary" onClick={loadCollectLogs} icon={<ClockCircleOutlined />}>搜索</Button>
          </Col>
        </Row>
      </Card>
      
      <Table 
        columns={[
          { title: 'ID', dataIndex: 'id', key: 'id' },
          { title: '任务日期', dataIndex: 'taskDate', key: 'taskDate' },
          { 
            title: '采集状态', 
            dataIndex: 'collectStatus', 
            key: 'collectStatus',
            render: (text: string) => <Tag color={getStatusColor(text)}>{getStatusText(text)}</Tag>
          },
          { title: '消息数量', dataIndex: 'messageCount', key: 'messageCount' },
          { title: '重试次数', dataIndex: 'retryCount', key: 'retryCount' },
          { title: '执行时间', dataIndex: 'executeTime', key: 'executeTime' },
          { title: '耗时(ms)', dataIndex: 'duration', key: 'duration' },
          { title: '错误信息', dataIndex: 'errorMsg', key: 'errorMsg', ellipsis: true },
        ]} 
        dataSource={collectLogs} 
        rowKey="id"
        loading={loading}
        pagination={{ pageSize: 10 }}
        locale={{ emptyText: <Empty description="暂无采集日志" /> }}
      />
    </div>
  );

  return (
    <div style={{ padding: 20 }}>
      <Card title="数据库数据展示示例" extra={<Badge count="数据库完整展示" status="processing" />}>
        <Tabs 
          activeKey={activeTab} 
          onChange={setActiveTab}
          type="card"
          size="large"
          tabBarExtraContent={{ style: { textAlign: 'right' } }}
        >
          <TabPane tab={<span><PieChartOutlined />统计概览</span>} key="overview">
            {renderOverviewPanel()}
          </TabPane>
          <TabPane tab={<span><MessageOutlined />消息数据</span>} key="messages">
            {renderMessagePanel()}
          </TabPane>
          <TabPane tab={<span><TrendingUpOutlined />持仓数据</span>} key="positions">
            {renderPositionPanel()}
          </TabPane>
          <TabPane tab={<span><BarChartOutlined />持仓历史</span>} key="history">
            {renderHistoryPanel()}
          </TabPane>
          <TabPane tab={<span><FileSearchOutlined />AI报告</span>} key="reports">
            {renderReportPanel()}
          </TabPane>
          <TabPane tab={<span><UserOutlined />审核日志</span>} key="review">
            {renderReviewLogPanel()}
          </TabPane>
          <TabPane tab={<span><ClockCircleOutlined />采集日志</span>} key="collect">
            {renderCollectLogPanel()}
          </TabPane>
        </Tabs>
      </Card>
    </div>
  );
};

export default DatabaseDemoPage;
