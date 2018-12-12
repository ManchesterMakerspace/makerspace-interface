

import { Routing } from "app/constants";
import { MemberDetails } from "app/entities/member";
import utils from "./common";
import { mock, mockRequests } from "../mockserver-client-helpers";
import memberPO from "../pageObjects/member";

export interface LoginMember extends Partial<MemberDetails> {
  email: string;
  password: string;
  expirationTime: any;
}

export class SignUpPageObject {
  public signupUrl = Routing.SignUp;
  public redirectUrl = Routing.Profile;

  public authToggleButton = "#auth-toggle";
  public emailExistsModal = "#email-exists";

  private signUpFormId = "#sign-up-form";
  public signUpForm = {
    id: this.signUpFormId,
    firstnameInput: `${this.signUpFormId}-firstname`,
    lastnameInput: `${this.signUpFormId}-lastname`,
    emailInput: `${this.signUpFormId}-email`,
    passwordInput: `${this.signUpFormId}-password`,
    submitButton: `${this.signUpFormId}-submit`,
    error: `${this.signUpFormId}-error`,
  };

  private membershipSelectTableId = "#membership-select-table";
  private getRow = (id: string, selector: string) => selector.replace("{ID}", id);
  public membershipSelectForm = {
    id: this.membershipSelectTableId,
    headers: {
      name: `${this.membershipSelectTableId}-name-header`,
      description: `${this.membershipSelectTableId}-description-header`,
      amount: `${this.membershipSelectTableId}-amount-header`,
    },
    row: {
      id: `${this.membershipSelectTableId}-{ID}`,
      select: `${this.membershipSelectTableId}-{ID}-select`,
      name: `${this.membershipSelectTableId}-{ID}-name`,
      description: `${this.membershipSelectTableId}-{ID}-description`,
      amount: `${this.membershipSelectTableId}-{ID}-amount`,
    },
    error: `${this.membershipSelectTableId}-error-row`,
    noData: `${this.membershipSelectTableId}-no-data-row`,
    loading: `${this.membershipSelectTableId}-loading`,
    discountCheckbox: "#discount-select",
  };

  private codeOfConductFormId = "#code-of-conduct"
  private memberContractFormId = "#code-of-conduct"
  public documentsSigning = {
    codeOfConductCheckbox: `${this.codeOfConductFormId}-checkbox`,
    codeOfConductSubmit: `${this.codeOfConductFormId}-submit`,
    codeOfConductError: `${this.codeOfConductFormId}-error`,
    memberContractCheckbox: `${this.memberContractFormId}-checkbox`,
    memberContractSubmit: `${this.memberContractFormId}-submit`,
    memberContractError: `${this.memberContractFormId}-error`,
    memberContractSignature: "IDK",
  }

  public goToSignup = () => browser.get(utils.buildUrl(this.signupUrl));

  public signUpUser = async (user: Partial<LoginMember>) => {
    await utils.fillInput(this.signUpForm.firstnameInput, user.firstname);
    await utils.fillInput(this.signUpForm.lastnameInput, user.lastname);
    await utils.fillInput(this.signUpForm.emailInput, user.email);
    await utils.fillInput(this.signUpForm.passwordInput, user.password);
    await utils.clickElement(this.signUpForm.submitButton);
  }

  public selectMembershipOption = async (optionId: string) => {
    await utils.clickElement(this.getRow(optionId, this.membershipSelectForm.row.select))
  }

  public signContract = () => {
    return browser.actions(). //Should draw a square w/ X in it
      mouseMove(this.documentsSigning.memberContractSignature).
      mouseDown().
      mouseMove({ x: 10, y: 10 }).
      mouseMove({ x: -10, y: 0 }).
      mouseMove({ x: 10, y: -10 }).
      mouseMove({ x: -10, y: 0 }).
      mouseUp().
      perform();
  };
}

export default new SignUpPageObject();