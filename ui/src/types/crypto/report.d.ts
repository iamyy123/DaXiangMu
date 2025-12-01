export interface ReportItem {
  id: number;
  messageId?: number;
  messageTitle?: string;
  reportDate: string;
  firstAnalysis?: string;
  positionSnapshot?: string;
  secondAnalysis?: string;
  adjustmentSuggestion?: string;
  analysisBasis?: string;
  reportStatus: 'PENDING' | 'APPROVED' | 'REJECTED';
  reviewerId?: number;
  reviewTime?: string;
  rejectReason?: string;
  createTime?: string;
}

