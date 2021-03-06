import axios from "axios";
import { QueryParams } from "app/interfaces";
import { handleApiError } from "api/utils/handleApiError";
import { Subscription, SubscriptionUpdate } from "app/entities/subscription";
import { buildSubscriptionUrl, buildSubscriptionsUrl } from "api/subscriptions/utils";

export interface SubscriptionQueryParams extends QueryParams {
  hideCanceled: boolean;
}

export const getSubscriptions = async (queryParams?: SubscriptionQueryParams, admin: boolean = false) => {
  try {
    return await axios.get(buildSubscriptionsUrl(admin), { params: (queryParams) });
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}

export const getSubscription = async (subId: string) => {
  try {
    return await axios.get(buildSubscriptionUrl(subId, false));
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
};

export const putSubscription = async (subId: string, subscription: SubscriptionUpdate) => {
  try {
    return await axios.put(buildSubscriptionUrl(subId, false), { subscription });
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
};

export const deleteSubscription = async (subId: string, admin: boolean = false) => {
  try {
    return await axios.delete(buildSubscriptionUrl(subId, admin));
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
};