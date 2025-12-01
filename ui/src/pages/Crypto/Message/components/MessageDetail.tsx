import { Modal, Descriptions, Tag, Typography } from 'antd';
import type { MessageItem } from '@/types/crypto/message';

const { Paragraph } = Typography;

interface MessageDetailProps {
  visible: boolean;
  message: MessageItem | null;
  onClose: () => void;
}

const MessageDetail: React.FC<MessageDetailProps> = ({ visible, message, onClose }) => {
  if (!message) return null;

  const sentimentColorMap: Record<string, string> = {
    利好: 'green',
    利空: 'red',
    中性: 'default',
  };

  return (
    <Modal
      title="消息详情"
      open={visible}
      onCancel={onClose}
      footer={null}
      width={800}
    >
      <Descriptions column={1} bordered>
        <Descriptions.Item label="消息标题">
          {message.title}
        </Descriptions.Item>
        <Descriptions.Item label="数字货币类型">
          <Tag color="blue">{message.coinType}</Tag>
        </Descriptions.Item>
        <Descriptions.Item label="情感倾向">
          <Tag color={sentimentColorMap[message.sentiment] || 'default'}>
            {message.sentiment || '-'}
          </Tag>
        </Descriptions.Item>
        <Descriptions.Item label="影响程度">
          {message.impactLevel ? `${message.impactLevel}/5` : '-'}
        </Descriptions.Item>
        <Descriptions.Item label="消息来源">
          {message.source || '-'}
        </Descriptions.Item>
        <Descriptions.Item label="原始链接">
          {message.sourceUrl ? (
            <a href={message.sourceUrl} target="_blank" rel="noopener noreferrer">
              {message.sourceUrl}
            </a>
          ) : '-'}
        </Descriptions.Item>
        <Descriptions.Item label="消息内容">
          <Paragraph>{message.content || '-'}</Paragraph>
        </Descriptions.Item>
        <Descriptions.Item label="AI分析结果">
          <Paragraph>{message.analysisResult || '-'}</Paragraph>
        </Descriptions.Item>
        <Descriptions.Item label="采集时间">
          {message.collectTime || '-'}
        </Descriptions.Item>
      </Descriptions>
    </Modal>
  );
};

export default MessageDetail;

