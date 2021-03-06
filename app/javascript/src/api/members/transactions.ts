import axios from "axios";
import { buildJsonUrl } from "app/utils";
import { Url } from "app/constants";
import { QueryParams } from "app/interfaces";
import { MemberDetails } from "app/entities/member";
import { buildMemberUrl } from "api/members/utils";
import { handleApiError } from "api/utils/handleApiError";

export const getMembers = async (queryParams?: QueryParams) => {
  try {
    return await axios.get(buildJsonUrl(Url.Members), { params: (queryParams) });
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}

export const getMember = async (id: string) => {
  try {
    return await axios.get(`${buildMemberUrl(id)}`);
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}

export const putMember = async (id: string, details: Partial<MemberDetails>, isAdmin: boolean) => {
  try {
    return await axios.put(`${buildMemberUrl(id, isAdmin)}`, { member: details });
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}

export const postMembers = async (details: Partial<MemberDetails>) => {
  try {
    return await axios.post(buildJsonUrl(Url.Admin.Members), { member: details });
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}

export const uploadMemberSignature = async (id: string, signature: WindowBase64) => {
  try {
    return await axios.put(`${buildMemberUrl(id)}`, { member: { signature }});
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}