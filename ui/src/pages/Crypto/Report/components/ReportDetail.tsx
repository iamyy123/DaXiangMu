import { Modal, Descriptions, Tag, Typography, Button, Space, Input, message } from 'antd';
import { CheckOutlined, CloseOutlined } from '@ant-design/icons';
import type { ReportItem } from '@/types/crypto/report';
import { useState } from 'react';
import { approveReport, rejectReport } from '@/services/crypto/report';

const { Paragraph, Title } = Typography;
const { TextArea } = Input;

interface ReportDetailProps {
  visible: boolean;
  report: ReportItem | null;
  onClose: () => void;
  onApprove: (report: ReportItem) => void;
  onReject: (report: ReportItem) => void;
}

const ReportDetail: React.FC<ReportDetailProps> = ({
  visible,
  report,
  onClose,
  onApprove,
  onReject,
}) => {
  const [rejectReason, setRejectReason] = useState('');

  if (!report) return null;

  const statusMap: Record<string, { color: string; text: string }> = {
    PENDING: { color: 'orange', text: '待审核' },
    APPROVED: { color: 'green', text: '已通过' },
    REJECTED: { color: 'red', text: '已驳回' },
  };
  const status = statusMap[report.reportStatus] || { color: 'default', text: report.reportStatus };

  const handleApprove = async () => {
    try {
      const response = await approveReport({ reportId: report.id });
      if (response.code === 200) {
        message.success('审核通过成功');
        onClose();
        // 通知父组件刷新
        if (window.location.pathname === '/crypto/report') {
          window.location.reload();
        }
      }
    } catch (error) {
      message.error('审核失败');
    }
  };

  const handleReject = async () => {
    if (!rejectReason.trim()) {
      message.warning('请输入驳回原因');
      return;
    }
    try {
      const response = await rejectReport({
        reportId: report.id,
        rejectReason: rejectReason,
      });
      if (response.code === 200) {
        message.success('驳回成功');
        onClose();
        setRejectReason('');
        // 通知父组件刷新
        if (window.location.pathname === '/crypto/report') {
          window.location.reload();
        }
      }
    } catch (error) {
      message.error('驳回失败');
    }
  };

  return (
    <Modal
      title="报告详情"
      open={visible}
      onCancel={onClose}
      footer={
        report.reportStatus === 'PENDING' ? (
          <Space>
            <Button onClick={onClose}>取消</Button>
            <Button danger icon={<CloseOutlined />} onClick={handleReject}>
              驳回
            </Button>
            <Button type="primary" icon={<CheckOutlined />} onClick={handleApprove}>
              通过
            </Button>
          </Space>
        ) : (
          <Button onClick={onClose}>关闭</Button>
        )
      }
      width={900}
    >
      <Descriptions column={1} bordered>
        <Descriptions.Item label="报告状态">
          <Tag color={status.color}>{status.text}</Tag>
        </Descriptions.Item>
        <Descriptions.Item label="报告日期">
          {report.reportDate}
        </Descriptions.Item>
        <Descriptions.Item label="关联消息">
          {report.messageTitle || '-'}
        </Descriptions.Item>
        <Descriptions.Item label="第一次分析结果">
          <Paragraph>{report.firstAnalysis || '-'}</Paragraph>
        </Descriptions.Item>
        <Descriptions.Item label="持仓快照">
          <Paragraph>{report.positionSnapshot || '-'}</Paragraph>
        </Descriptions.Item>
        <Descriptions.Item label="第二次分析结果">
          <Paragraph>{report.secondAnalysis || '-'}</Paragraph>
        </Descriptions.Item>
        <Descriptions.Item label="调整建议">
          <Paragraph>{report.adjustmentSuggestion || '-'}</Paragraph>
        </Descriptions.Item>
        <Descriptions.Item label="分析依据">
          <Paragraph>{report.analysisBasis || '-'}</Paragraph>
        </Descriptions.Item>
        {report.reportStatus === 'REJECTED' && (
          <Descriptions.Item label="驳回原因">
            <Paragraph>{report.rejectReason || '-'}</Paragraph>
          </Descriptions.Item>
        )}
      </Descriptions>
      {report.reportStatus === 'PENDING' && (
        <div style={{ marginTop: 16 }}>
          <Title level={5}>驳回原因（如驳回）</Title>
          <TextArea
            rows={3}
            value={rejectReason}
            onChange={(e) => setRejectReason(e.target.value)}
            placeholder="请输入驳回原因"
          />
        </div>
      )}
    </Modal>
  );
};

export default ReportDetail;

