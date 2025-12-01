/**
 * 消息列表页
 * 功能：按时间倒序展示消息，支持按数字货币类型、利好/利空筛选
 */
import { PageContainer, ProTable } from '@ant-design/pro-components';
import type { ProColumns } from '@ant-design/pro-components';
import { Tag, Button, Space, message } from 'antd';
import { EyeOutlined, ReloadOutlined } from '@ant-design/icons';
import { getMessageList, triggerCollect } from '@/services/crypto/message';
import type { MessageItem } from '@/types/crypto/message';
import { useState, useRef } from 'react';
import type { ActionType } from '@ant-design/pro-components';
import MessageDetail from './components/MessageDetail';

const Message: React.FC = () => {
  const actionRef = useRef<ActionType>();
  const [detailVisible, setDetailVisible] = useState(false);
  const [selectedMessage, setSelectedMessage] = useState<MessageItem | null>(null);
  const [loading, setLoading] = useState(false);

  const handleViewDetail = (record: MessageItem) => {
    setSelectedMessage(record);
    setDetailVisible(true);
  };

  const handleCollect = async () => {
    setLoading(true);
    try {
      const response = await triggerCollect();
      if (response.code === 200) {
        message.success('消息采集已触发');
        actionRef.current?.reload();
      } else {
        message.error(response.msg || '消息采集失败');
      }
    } catch (error) {
      message.error('消息采集失败');
    } finally {
      setLoading(false);
    }
  };

  const columns: ProColumns<MessageItem>[] = [
    {
      title: '消息标题',
      dataIndex: 'title',
      ellipsis: true,
      width: 300,
      hideInSearch: true,
    },
    {
      title: '数字货币类型',
      dataIndex: 'coinType',
      width: 120,
      valueType: 'select',
      valueEnum: {
        BTC: { text: 'BTC' },
        ETH: { text: 'ETH' },
        SOL: { text: 'SOL' },
        USDT: { text: 'USDT' },
      },
      render: (text: string) => <Tag color="blue">{text}</Tag>,
    },
    {
      title: '情感倾向',
      dataIndex: 'sentiment',
      width: 100,
      valueType: 'select',
      valueEnum: {
        利好: { text: '利好', status: 'Success' },
        利空: { text: '利空', status: 'Error' },
        中性: { text: '中性', status: 'Default' },
      },
      render: (text: string) => {
        const colorMap: Record<string, string> = {
          利好: 'green',
          利空: 'red',
          中性: 'default',
        };
        return <Tag color={colorMap[text] || 'default'}>{text || '-'}</Tag>;
      },
    },
    {
      title: '影响程度',
      dataIndex: 'impactLevel',
      width: 100,
      render: (text: number) => text ? `${text}/5` : '-',
    },
    {
      title: '消息来源',
      dataIndex: 'source',
      width: 120,
    },
    {
      title: '采集时间',
      dataIndex: 'collectTime',
      width: 180,
      valueType: 'dateTime',
    },
    {
      title: '操作',
      width: 100,
      fixed: 'right',
      render: (_: any, record: MessageItem) => (
        <Space>
          <Button
            type="link"
            icon={<EyeOutlined />}
            onClick={() => handleViewDetail(record)}
          >
            查看
          </Button>
        </Space>
      ),
    },
  ];

  return (
    <PageContainer 
      title="消息列表"
      extra={[
        <Button
          key="collect"
          type="primary"
          icon={<ReloadOutlined />}
          loading={loading}
          onClick={handleCollect}
        >
          手动采集
        </Button>,
      ]}
    >
      <ProTable<MessageItem>
        actionRef={actionRef}
        request={async (params) => {
          const response = await getMessageList({
            coinType: params.coinType,
            sentiment: params.sentiment,
            pageNum: params.current,
            pageSize: params.pageSize,
          });
          return {
            data: response.data?.list || response.rows || [],
            success: response.code === 200,
            total: response.data?.total || response.total || 0,
          };
        }}
        columns={columns}
        rowKey="id"
        search={{
          labelWidth: 'auto',
        }}
        pagination={{
          defaultPageSize: 10,
          showSizeChanger: true,
        }}
        toolBarRender={() => []}
      />
      <MessageDetail
        visible={detailVisible}
        message={selectedMessage}
        onClose={() => setDetailVisible(false)}
      />
    </PageContainer>
  );
};

export default Message;

