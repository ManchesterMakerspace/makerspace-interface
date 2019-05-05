import { useState, useEffect, useCallback } from "react";
import * as hash from "object-hash";
import isObject from "lodash-es/isObject";

import { normalizeTransaction } from "api/utils/normalizeTransaction";
import { TransactionState } from "ui/hooks/types";

export interface AutonomousTransactionState<T> extends TransactionState<T> {
  refresh: () => void;
}

export const useAutonomousTransaction = <T>(transaction: Function, args: any[]): AutonomousTransactionState<T> => {
  const [state, setState] = useState({ loading: false, error: "", data: undefined });
  const [force, setForce] = useState(false);
  const refresh = useCallback(() => setForce(prevState => !prevState), []);

  useEffect(() => {
    let aborted = false;

    const callTransaction = async () => {
      !aborted && setState(prevState => ({ ...prevState, loading: true }));

      const normalized = await normalizeTransaction(transaction, args);

      !aborted && setState({
        loading: false,
        error: normalized.error,
        data: normalized.response && normalized.response.data
      });
    };

    callTransaction();

    return () => { aborted = true; };
  }, [...args.map((arg: any) => isObject(arg) ? hash(arg) : arg), force]);

  return { ...state, refresh };
};
