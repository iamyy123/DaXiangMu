export interface MessageItem {
  id: number;
  coinType: string;
  title: string;
  content?: string;
  source?: string;
  sourceUrl?: string;
  sentiment?: string;
  impactLevel?: number;
  analysisResult?: string;
  collectTime?: string;
  status?: string;
}

