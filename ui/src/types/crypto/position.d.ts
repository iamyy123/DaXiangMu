export interface PositionItem {
  id: number;
  coinType: string;
  amount: number;
  percentage: number;
  usdValue: number;
  price?: number;
  snapshotDate?: string;
}

export interface PositionHistoryItem {
  id: number;
  coinType: string;
  amount: number;
  percentage: number;
  usdValue: number;
  price?: number;
  changeType?: string;
  changeReason?: string;
  snapshotDate: string;
}

