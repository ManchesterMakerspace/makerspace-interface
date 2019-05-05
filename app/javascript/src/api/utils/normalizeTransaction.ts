import { AxiosResponse } from "axios";

import { isObject } from "util";
import { isApiErrorResponse, handleApiError } from "api/utils/handleApiError";

export interface NormalizedTransaction<T> {
  response: AxiosResponse<T>;
  error?: string;
}

export async function normalizeTransaction<T>(transaction: Function, args: any[]): Promise<NormalizedTransaction<T>> {
  let response: AxiosResponse<T>;
  let error: string;

  try {
    response = await transaction(...args);
  } catch (e) {
    const apiError = isApiErrorResponse(e) ? e : handleApiError(e);
    error = apiError.errorMessage;
    response = apiError.response;
  }

  return {
    response,
    error,
  };
}
