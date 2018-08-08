import axios from "axios";
import { Url } from "app/constants";
import { buildJsonUrl, handleApiError } from "app/utils";
import { QueryParams } from "app/interfaces";

export const getPlans = async (queryParams?: QueryParams) => {
  try {
    return await axios.get(buildJsonUrl(Url.BillingPlans), { params: queryParams });
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}