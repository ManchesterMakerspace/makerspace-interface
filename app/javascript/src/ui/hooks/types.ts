export interface TransactionState<T> {
  loading: boolean;
  error: string;
  data: T;
}
