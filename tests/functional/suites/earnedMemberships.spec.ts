import * as moment from "moment";
import { timeToDate } from "ui/utils/timeToDate";
import { EarnedMembership, Report, Requirement, Term, ReportRequirement } from "app/entities/earnedMembership";
import auth, { LoginMember } from "../pageObjects/auth";
import { adminUser, defaultMembers, basicUser } from "../constants/member";
import { mockRequests, mock } from "../mockserver-client-helpers";
import { defaultMemberships, basicEarnedMembership, basicRequirement, defaultReports, basicReport, basicReportRequirement } from "../constants/earnedMembership";
import membershipPO from "../pageObjects/earnedMembership";
import reportPO from "../pageObjects/report";
import utils from "../pageObjects/common";
import header from "../pageObjects/header";
import memberPO from "../pageObjects/member";

describe("Earned Memberships", () => {
  describe("Admin user", () => {
    describe("From list view", () => {
      const newRequirement: Requirement = {
          ...basicRequirement,
          name: "Foo",
          termLength: 1,
          targetCount: 2,
      };
      const newRequirement2: Requirement = {
        ...basicRequirement,
        name: "Bar",
        termLength: 3,
        targetCount: 5,
      };
      const initMembership: EarnedMembership = {
        ...basicEarnedMembership,
        requirements: [newRequirement, newRequirement2],
      };

      beforeEach(() => {
        return auth.autoLogin(adminUser, undefined, { earned_membership: true }).then(async () => {
            await mock(mockRequests.earnedMemberships.get.ok(defaultMemberships, {}, true));
            await header.navigateTo(header.links.earnedMemberships);
            await utils.waitForPageLoad(membershipPO.listUrl);
            expect(await utils.isElementDisplayed(membershipPO.getErrorRowId())).toBeFalsy();
            expect(await utils.isElementDisplayed(membershipPO.getNoDataRowId())).toBeFalsy();
            expect(await utils.isElementDisplayed(membershipPO.getLoadingId())).toBeFalsy();
            expect(await utils.isElementDisplayed(membershipPO.getTitleId())).toBeTruthy();
            expect(await membershipPO.getColumnText("expirationTime", defaultMemberships[0].id)).toBeTruthy();
        });
      });
      it("Loads a list of earned memberships", async (done) => {
        await membershipPO.verifyListView(defaultMemberships, membershipPO.fieldEvaluator);
        done();
      });
      it("Can create new earned memberships for members", async (done) => {
        await utils.clickElement(membershipPO.actionButtons.create);
        await utils.waitForVisible(membershipPO.membershipForm.submit);

        await mock(mockRequests.members.get.ok(defaultMembers), 0);
        await utils.fillSearchInput(membershipPO.membershipForm.member, defaultMembers[0].email, defaultMembers[0].id);

        await utils.fillInput(membershipPO.requirementForm(0).name, newRequirement.name);
        await utils.fillInput(membershipPO.requirementForm(0).targetCount, String(newRequirement.targetCount));
        await utils.selectDropdownByValue(membershipPO.requirementForm(0).termLengthSelect, String(newRequirement.termLength));

        await utils.clickElement(membershipPO.membershipForm.addRequirementButton);
        await utils.fillInput(membershipPO.requirementForm(1).name, newRequirement2.name);
        await utils.fillInput(membershipPO.requirementForm(1).targetCount, String(newRequirement2.targetCount));
        await utils.selectDropdownByValue(membershipPO.requirementForm(1).termLengthSelect, String(newRequirement2.termLength));

        await mock(mockRequests.earnedMemberships.post.ok(initMembership));
        await mock(mockRequests.earnedMemberships.get.ok([initMembership], undefined, true));
        await utils.clickElement(membershipPO.membershipForm.submit);
        await utils.waitForNotVisible(membershipPO.membershipForm.submit);
        expect((await membershipPO.getAllRows()).length).toEqual(1);
        await membershipPO.verifyFields(initMembership, membershipPO.fieldEvaluator);
        done();
      });
      xit("Can edit earned memberships from list", async () => {
        const updatedMembership = {
          ...defaultMemberships[0],
          name: "Foobar",
          requirements: [{
            ...basicRequirement,
            termLength: 3
          }]
        };

        await membershipPO.selectRow(defaultMemberships[0].id);



      });
      it("Create membership form validation", async (done) => {
        await utils.clickElement(membershipPO.actionButtons.create);
        await utils.waitForVisible(membershipPO.membershipForm.submit);

        await utils.clickElement(membershipPO.membershipForm.submit);
        await utils.assertInputError(membershipPO.membershipForm.member)
        await utils.assertInputError(membershipPO.requirementForm(0).name)
        await utils.assertInputError(membershipPO.requirementForm(0).targetCount)

        await mock(mockRequests.members.get.ok(defaultMembers), 0);
        await utils.fillSearchInput(membershipPO.membershipForm.member, defaultMembers[0].email, defaultMembers[0].id);

        await utils.fillInput(membershipPO.requirementForm(0).name, newRequirement.name);
        await utils.fillInput(membershipPO.requirementForm(0).targetCount, String(newRequirement.targetCount));
        await utils.selectDropdownByValue(membershipPO.requirementForm(0).termLengthSelect, String(newRequirement.termLength));

        expect(await utils.isElementDisplayed(membershipPO.requirementForm(1).name)).toBeFalsy();
        await utils.clickElement(membershipPO.membershipForm.addRequirementButton);
        await utils.clickElement(membershipPO.membershipForm.submit);
        await utils.assertInputError(membershipPO.requirementForm(1).name)
        await utils.assertInputError(membershipPO.requirementForm(1).targetCount)
        await utils.clickElement(membershipPO.membershipForm.removeRequirementButton);
        expect(await utils.isElementDisplayed(membershipPO.requirementForm(1).name)).toBeFalsy();

        // No create mock, should display API error
        expect(await utils.isElementDisplayed(membershipPO.membershipForm.error)).toBeFalsy();
        await utils.clickElement(membershipPO.membershipForm.submit);
        await utils.waitForVisible(membershipPO.membershipForm.error);
        await mock(mockRequests.earnedMemberships.post.ok(initMembership));
        await utils.clickElement(membershipPO.membershipForm.submit);
        await utils.waitForNotVisible(membershipPO.membershipForm.submit);
        done();
      });
    });
  });
  fdescribe("Earned member reporting", () => {
    const membershipUser = {
      ...basicUser,
      earnedMembershipId: "foo"
    }
    const updatedMember: LoginMember = {
      ...basicUser,
      expirationTime: moment().add(2, "months").valueOf()
    }
    const membership = {
      ...basicEarnedMembership,
      id: membershipUser.earnedMembershipId,
    }
    const newReportRequirement: ReportRequirement = {
      ...basicReportRequirement,
      memberIds: [defaultMembers[0].id, defaultMembers[1].id]
    };
    const initReport: Report = {
      ...basicReport,
      reportRequirements: [newReportRequirement]
    };
    beforeEach(() => {
      return mock(mockRequests.earnedMembershipReports.get.ok(defaultReports, {})).then(async () => {
        await mock(mockRequests.earnedMemberships.show.ok(membership));
        await auth.autoLogin(membershipUser, undefined, { earned_membership: true });
        expect(await utils.isElementDisplayed(reportPO.getErrorRowId())).toBeFalsy();
        expect(await utils.isElementDisplayed(reportPO.getNoDataRowId())).toBeFalsy();
        expect(await utils.isElementDisplayed(reportPO.getLoadingId())).toBeFalsy();
        expect(await utils.isElementDisplayed(reportPO.getTitleId())).toBeTruthy();
        expect(await reportPO.getColumnText("date", defaultReports[0].id)).toBeTruthy();
      });
    })
    it("Can view list of reports in profile", async (done) => {
      await reportPO.verifyListView(defaultReports, reportPO.fieldEvaluator);
      done();
    });
    it("Can submit new reports from profile", async (done) => {
      await utils.clickElement(reportPO.actionButtons.create);
      await utils.waitForVisible(reportPO.reportForm.submit);

      await mock(mockRequests.members.get.ok(defaultMembers), 0);
      await utils.fillSearchInput(reportPO.reportRequirementForm(0).member(0), defaultMembers[0].email, defaultMembers[0].id);

      await utils.fillInput(reportPO.reportRequirementForm(0).reportedCount, String(newReportRequirement.reportedCount));

      await utils.clickElement(reportPO.reportRequirementForm(0).addMemberButton);
      await mock(mockRequests.members.get.ok(defaultMembers.slice(1, 10)), 0);
      await utils.fillSearchInput(reportPO.reportRequirementForm(0).member(1), defaultMembers[1].email, defaultMembers[1].id);

      await mock(mockRequests.earnedMembershipReports.post.ok(initReport));
      await mock(mockRequests.earnedMembershipReports.get.ok([initReport], undefined));
      await mock(mockRequests.earnedMemberships.show.ok(membership));
      await mock(mockRequests.member.get.ok(updatedMember.id, updatedMember));
      await utils.clickElement(reportPO.reportForm.submit);
      await utils.waitForNotVisible(reportPO.reportForm.submit);
      expect((await reportPO.getAllRows()).length).toEqual(1);
      await reportPO.verifyFields(initReport, reportPO.fieldEvaluator);
      done();
    });
    it("Create report form validation", async (done) => {
      await utils.clickElement(reportPO.actionButtons.create);
      await utils.waitForVisible(reportPO.reportForm.submit);

      await utils.clickElement(reportPO.reportForm.submit);
      await utils.assertInputError(reportPO.reportRequirementForm(0).reportedCount)

      await utils.fillInput(reportPO.reportRequirementForm(0).reportedCount, String(newReportRequirement.reportedCount));

      expect(await utils.isElementDisplayed(reportPO.reportRequirementForm(0).member(1))).toBeFalsy();
      await utils.clickElement(reportPO.reportRequirementForm(0).addMemberButton);
      expect(await utils.isElementDisplayed(reportPO.reportRequirementForm(0).member(1))).toBeTruthy();

      // No create mock, should display API error
      expect(await utils.isElementDisplayed(reportPO.reportForm.error)).toBeFalsy();
      await utils.clickElement(reportPO.reportForm.submit);
      await utils.waitForVisible(reportPO.reportForm.error);
      await mock(mockRequests.earnedMembershipReports.post.ok(initReport));
      await mock(mockRequests.earnedMemberships.show.ok(membership));
      await mock(mockRequests.member.get.ok(updatedMember.id, updatedMember));
      await utils.clickElement(reportPO.reportForm.submit);
      await utils.waitForNotVisible(reportPO.reportForm.submit);
      expect(await utils.getElementText(memberPO.memberDetail.expiration)).toEqual(timeToDate(updatedMember.expirationTime));
      done();
    });
  });
});