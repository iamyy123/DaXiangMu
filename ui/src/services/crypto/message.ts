import { request } from '@umijs/max';
import type { 
  MessageItem, 
  MessageListResponse, 
  MessageDetailResponse,
  MessageCategory,
  ImpactLevel,
  RealtimeMessageStreamItem,
  MessageSubscriptionSettings
} from '@/types/crypto/message';

/**
 * 获取消息列表
 * @param params 查询参数
 */
export async function getMessageList(params?: {
  page?: number;
  pageSize?: number;
  importance?: ImpactLevel;
  readStatus?: 'read' | 'unread';
  source?: string;
  keyword?: string;
  category?: MessageCategory;
  startTime?: string;
  endTime?: string;
  sortBy?: 'publishTime' | 'importance' | 'relevance';
  sortOrder?: 'asc' | 'desc';
  includeTags?: string[];
  excludeTags?: string[];
  includeUnverified?: boolean;
}) {
  return request<{ 
    data: MessageListResponse; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/message/list', {
    method: 'GET',
    params,
  });
}

/**
 * 获取消息详情
 * @param id 消息ID
 */
export async function getMessageDetail(id: string) {
  return request<{ 
    data: MessageDetailResponse; 
    success: boolean; 
    message?: string 
  }>(`/api/crypto/message/detail/${id}`, {
    method: 'GET',
  });
}

/**
 * 获取实时消息流
 * @param params 流参数
 */
export async function getRealtimeMessageStream(params?: {
  categories?: MessageCategory[];
  minimumImportance?: ImpactLevel;
  onlyBreaking?: boolean;
  includeNotifications?: boolean;
}) {
  return request<{ 
    data: RealtimeMessageStreamItem[]; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/message/stream', {
    method: 'GET',
    params,
  });
}

/**
 * 更新消息阅读状态
 * @param ids 消息ID列表
 * @param status 阅读状态
 */
export async function updateMessageReadStatus(ids: string[], status: 'read' | 'unread') {
  return request<{ 
    success: boolean; 
    message?: string; 
    updatedCount: number;
  }>('/api/crypto/message/read-status', {
    method: 'POST',
    data: { ids, status },
  });
}

/**
 * 更新消息收藏状态
 * @param id 消息ID
 * @param isCollected 是否收藏
 */
export async function updateMessageCollection(id: string, isCollected: boolean) {
  return request<{ 
    success: boolean; 
    message?: string 
  }>(`/api/crypto/message/collect/${id}`, {
    method: 'POST',
    data: { isCollected },
  });
}

/**
 * 获取消息统计数据
 */
export async function getMessageStatistics() {
  return request<{ 
    data: MessageListResponse['statistics']; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/message/statistics', {
    method: 'GET',
  });
}

/**
 * 获取重要消息提醒
 */
export async function getImportantAlerts() {
  return request<{ 
    data: MessageItem[]; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/message/alerts', {
    method: 'GET',
  });
}

/**
 * 获取订阅设置
 */
export async function getSubscriptionSettings() {
  return request<{ 
    data: MessageSubscriptionSettings; 
    success: boolean; 
    message?: string 
  }>('/api/crypto/message/subscriptions', {
    method: 'GET',
  });
}

/**
 * 更新订阅设置
 * @param settings 订阅设置
 */
export async function updateSubscriptionSettings(settings: MessageSubscriptionSettings) {
  return request<{ 
    success: boolean; 
    message?: string 
  }>('/api/crypto/message/subscriptions', {
    method: 'PUT',
    data: settings,
  });
}

/**
 * 触发消息采集
 */
export async function triggerCollect() {
  return request<{ 
    success: boolean; 
    message?: string;
    collectedCount?: number;
  }>('/api/crypto/message/collect', {
    method: 'POST',
    data: {},
  });
}

/**
 * 获取相关消息推荐
 * @param messageId 消息ID
 * @param limit 数量限制
 */
export async function getRelatedMessages(messageId: string, limit?: number) {
  return request<{ 
    data: MessageItem[]; 
    success: boolean; 
    message?: string 
  }>(`/api/crypto/message/related/${messageId}`, {
    method: 'GET',
    params: { limit },
  });
}

