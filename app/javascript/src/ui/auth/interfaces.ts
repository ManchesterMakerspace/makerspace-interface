import { MemberDetails, Properties as MemberProperties } from "app/entities/member";
import { Permission } from "app/entities/permission";
import { CollectionOf } from "app/interfaces";

export interface AuthState {
  currentUser: AuthMember;
  permissions: CollectionOf<Permission>;
  isRequesting: boolean;
  error: string;
}

export interface AuthForm {
  email: string;
  password: string;
}

export interface SignUpForm {
  firstname: string;
  lastname: string;
  email: string;
  password: string;
}

export type AuthMember = Pick<MemberDetails,
                        MemberProperties.Id |
                        MemberProperties.Email |
                        MemberProperties.Lastname |
                        MemberProperties.Firstname |
                        MemberProperties.Expiration
                      > & Partial<MemberDetails> & {
  isAdmin: boolean;
};

type NewUserSignUp = Pick<MemberDetails,
                          MemberProperties.Email |
                          MemberProperties.Lastname |
                          MemberProperties.Firstname> & {
  password: string;
  planId?: string;
  paymentMethod?: string;
  paymentMethodNonce?: string;
}