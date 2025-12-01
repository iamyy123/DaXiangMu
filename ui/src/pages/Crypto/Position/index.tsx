/**
 * 持仓数据页
 * 功能：饼图展示当前资产占比，折线图展示近7日持仓变化，支持导出Excel
 */
import { PageContainer } from '@ant-design/pro-components';
import { Card, Button, Space, Table, message } from 'antd';
import { DownloadOutlined, ReloadOutlined } from '@ant-design/icons';
import { Pie } from '@ant-design/plots';
import { Line } from '@ant-design/plots';
import { useEffect, useState } from 'react';
import { getCurrentPosition, getPositionHistory, exportPosition } from '@/services/crypto/position';
import type { PositionItem, PositionHistoryItem } from '@/types/crypto/position';
import type { ColumnsType } from 'antd/es/table';

const Position: React.FC = () => {
  const [currentData, setCurrentData] = useState<PositionItem[]>([]);
  const [historyData, setHistoryData] = useState<PositionHistoryItem[]>([]);

  useEffect(() => {
    loadCurrentPosition();
    loadPositionHistory();
  }, []);

  const loadCurrentPosition = async () => {
    try {
      const response = await getCurrentPosition();
      if (response.code === 200) {
        setCurrentData(response.data || []);
      }
    } catch (error) {
      console.error('加载持仓数据失败:', error);
    }
  };

  const loadPositionHistory = async () => {
    try {
      const response = await getPositionHistory({ days: 7 });
      if (response.code === 200) {
        setHistoryData(response.data || []);
      }
    } catch (error) {
      console.error('加载持仓历史失败:', error);
    }
  };

  const handleExport = async () => {
    try {
      const response = await exportPosition();
      if (response) {
        // 创建下载链接
        const blob = new Blob([response], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);
        const link = document.createElement('a');
        link.href = url;
        link.download = `持仓数据_${new Date().toISOString().split('T')[0]}.xlsx`;
        link.click();
        window.URL.revokeObjectURL(url);
        message.success('导出成功');
      }
    } catch (error) {
      message.error('导出失败');
      console.error('导出失败:', error);
    }
  };

  const handleRefresh = () => {
    loadCurrentPosition();
    loadPositionHistory();
  };

  const tableColumns: ColumnsType<PositionItem> = [
    {
      title: '数字货币类型',
      dataIndex: 'coinType',
      key: 'coinType',
    },
    {
      title: '持仓数量',
      dataIndex: 'amount',
      key: 'amount',
      render: (value: number) => value?.toFixed(8) || '0.00000000',
    },
    {
      title: '持仓占比',
      dataIndex: 'percentage',
      key: 'percentage',
      render: (value: number) => `${value?.toFixed(2) || '0.00'}%`,
    },
    {
      title: '美元价值',
      dataIndex: 'usdValue',
      key: 'usdValue',
      render: (value: number) => `$${value?.toFixed(2) || '0.00'}`,
    },
    {
      title: '当前价格',
      dataIndex: 'price',
      key: 'price',
      render: (value: number) => value ? `$${value.toFixed(2)}` : '-',
    },
  ];

  // 饼图数据
  const pieData = currentData.map(item => ({
    type: item.coinType,
    value: Number(item.percentage) || 0,
  }));

  // 折线图数据
  const lineData = historyData.map(item => ({
    date: item.snapshotDate,
    coinType: item.coinType,
    percentage: Number(item.percentage) || 0,
  }));

  const pieConfig = {
    data: pieData,
    angleField: 'value',
    colorField: 'type',
    radius: 0.8,
    label: {
      type: 'outer',
      content: '{name}: {value}%',
    },
    interactions: [{ type: 'element-active' }],
  };

  const lineConfig = {
    data: lineData,
    xField: 'date',
    yField: 'percentage',
    seriesField: 'coinType',
    smooth: true,
    point: {
      size: 4,
      shape: 'circle',
    },
    legend: {
      position: 'top',
    },
    tooltip: {
      formatter: (datum: any) => ({
        name: datum.coinType,
        value: `${datum.percentage}%`,
      }),
    },
  };

  return (
    <PageContainer
      title="持仓数据"
      extra={
        <Space>
          <Button icon={<ReloadOutlined />} onClick={handleRefresh}>
            刷新
          </Button>
          <Button type="primary" icon={<DownloadOutlined />} onClick={handleExport}>
            导出Excel
          </Button>
        </Space>
      }
    >
      <Card title="当前资产占比" style={{ marginBottom: 16 }}>
        {pieData.length > 0 ? (
          <Pie {...pieConfig} height={400} />
        ) : (
          <div style={{ textAlign: 'center', padding: '100px 0', color: '#999' }}>
            暂无数据
          </div>
        )}
      </Card>
      <Card title="持仓明细" style={{ marginBottom: 16 }}>
        <Table
          columns={tableColumns}
          dataSource={currentData}
          rowKey="id"
          pagination={false}
        />
      </Card>
      <Card title="近7日持仓变化">
        {lineData.length > 0 ? (
          <Line {...lineConfig} height={400} />
        ) : (
          <div style={{ textAlign: 'center', padding: '100px 0', color: '#999' }}>
            暂无历史数据
          </div>
        )}
      </Card>
    </PageContainer>
  );
};

export default Position;

