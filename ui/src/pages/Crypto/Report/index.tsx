/**
 * 建议报告页
 * 功能：展示AI建议核心内容，关联原始消息，底部放置审核操作按钮
 */
import { PageContainer, ProTable } from '@ant-design/pro-components';
import { Button, Space, Tag, Modal, message } from 'antd';
import { CheckOutlined, CloseOutlined, EyeOutlined } from '@ant-design/icons';
import { getReportList, approveReport, rejectReport } from '@/services/crypto/report';
import type { ReportItem } from '@/types/crypto/report';
import { useState } from 'react';
import ReportDetail from './components/ReportDetail';

const Report: React.FC = () => {
  const [detailVisible, setDetailVisible] = useState(false);
  const [selectedReport, setSelectedReport] = useState<ReportItem | null>(null);

  const handleViewDetail = (record: ReportItem) => {
    setSelectedReport(record);
    setDetailVisible(true);
  };

  const handleApprove = async (record: ReportItem) => {
    Modal.confirm({
      title: '确认审核通过',
      content: '审核通过后将自动更新持仓数据，是否继续？',
      onOk: async () => {
        try {
          const response = await approveReport({ reportId: record.id });
          if (response.code === 200) {
            message.success('审核通过成功');
            // 刷新列表
            window.location.reload();
          }
        } catch (error) {
          message.error('审核失败');
        }
      },
    });
  };

  const handleReject = async (record: ReportItem) => {
    Modal.confirm({
      title: '确认驳回',
      content: '请输入驳回原因',
      onOk: async () => {
        // TODO: 实现驳回原因输入
        try {
          const response = await rejectReport({
            reportId: record.id,
            rejectReason: '用户驳回',
          });
          if (response.code === 200) {
            message.success('驳回成功');
            window.location.reload();
          }
        } catch (error) {
          message.error('驳回失败');
        }
      },
    });
  };

  const columns = [
    {
      title: '报告日期',
      dataIndex: 'reportDate',
      width: 120,
      valueType: 'date',
    },
    {
      title: '关联消息',
      dataIndex: 'messageTitle',
      ellipsis: true,
      width: 200,
    },
    {
      title: '报告状态',
      dataIndex: 'reportStatus',
      width: 120,
      render: (text: string) => {
        const statusMap: Record<string, { color: string; text: string }> = {
          PENDING: { color: 'orange', text: '待审核' },
          APPROVED: { color: 'green', text: '已通过' },
          REJECTED: { color: 'red', text: '已驳回' },
        };
        const status = statusMap[text] || { color: 'default', text: text };
        return <Tag color={status.color}>{status.text}</Tag>;
      },
    },
    {
      title: '创建时间',
      dataIndex: 'createTime',
      width: 180,
      valueType: 'dateTime',
    },
    {
      title: '操作',
      width: 200,
      fixed: 'right',
      render: (_: any, record: ReportItem) => (
        <Space>
          <Button
            type="link"
            icon={<EyeOutlined />}
            onClick={() => handleViewDetail(record)}
          >
            查看
          </Button>
          {record.reportStatus === 'PENDING' && (
            <>
              <Button
                type="link"
                icon={<CheckOutlined />}
                onClick={() => handleApprove(record)}
              >
                通过
              </Button>
              <Button
                type="link"
                danger
                icon={<CloseOutlined />}
                onClick={() => handleReject(record)}
              >
                驳回
              </Button>
            </>
          )}
        </Space>
      ),
    },
  ];

  return (
    <PageContainer title="建议报告">
      <ProTable<ReportItem>
        request={async (params) => {
          const response = await getReportList({
            ...params,
            pageNum: params.current,
            pageSize: params.pageSize,
          });
          return {
            data: response.data?.list || [],
            success: response.code === 200,
            total: response.data?.total || 0,
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
      />
      <ReportDetail
        visible={detailVisible}
        report={selectedReport}
        onClose={() => setDetailVisible(false)}
        onApprove={handleApprove}
        onReject={handleReject}
      />
    </PageContainer>
  );
};

export default Report;

