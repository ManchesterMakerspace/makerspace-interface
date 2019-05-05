import { useState, useCallback } from "react";

import { NormalizedTransaction, normalizeTransaction } from "api/utils/normalizeTransaction";
import { TransactionState } from "ui/hooks/types";

export interface CallTransactionState<T> extends TransactionState<T> {
  called: boolean;
  call: (...args: any[]) => Promise<NormalizedTransaction<T>>;
}

export const useCallTransaction = <T>(transaction: Function): CallTransactionState<T> => {
  const [state, setState] = useState({ loading: false, error: "", data: undefined, called: false });
  const call = useCallback(async (...args: any[]) => {
    setState(prevState => ({ ...prevState, loading: true, called: true }));

    const normalized = await normalizeTransaction<T>(transaction, args);

    setState(prevState => ({
      ...prevState,
      loading: false,
      error: normalized.error,
      data: normalized.response && normalized.response.data
    }));

    return normalized;
  }, []);

  return { ...state, call };
};
