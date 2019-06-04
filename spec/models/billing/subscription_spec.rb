require 'rails_helper'

RSpec.describe BraintreeService::Subscription, type: :model do
  let(:gateway) { double } # Create a fake gateway
  let(:fake_subscription) { double(id: "foo") }
  let(:success_result) { double(success?: true) }
  let(:error_result) { double(success?: false) }

  it "has a factory" do
    expect(build(:subscription)).to be_truthy
  end

  context "public methods" do
    describe "#get_subscriptions" do
      it "fetches subscriptions" do
        allow(gateway).to receive_message_chain(:subscription, search: [fake_subscription]) # Setup method calls to gateway
        expect(gateway.subscription).to receive(:search).and_return([fake_subscription])
        allow(BraintreeService::Subscription).to receive(:normalize_subscription).with(gateway, fake_subscription).and_return(fake_subscription)

        result = BraintreeService::Subscription.get_subscriptions(gateway)
        expect(result).to eq([fake_subscription])
      end
    end

    describe "#get_subscription" do 
      it "fetches a subscription" do 
        allow(gateway).to receive_message_chain(:subscription, find: fake_subscription) # Setup method calls to gateway
        expect(gateway.subscription).to receive(:find).with("foo").and_return(fake_subscription)
        allow(BraintreeService::Subscription).to receive(:normalize_subscription).with(gateway, fake_subscription).and_return(fake_subscription)

        result = BraintreeService::Subscription.get_subscription(gateway, "foo")
        expect(result).to eq(fake_subscription)
      end
    end

    describe "#cancel" do 
      it "cancels a subscription" do 
        allow(gateway).to receive_message_chain(:subscription, cancel: fake_subscription) # Setup method calls to gateway
        expect(gateway.subscription).to receive(:cancel).with("foo").and_return(nil)
        result = BraintreeService::Subscription.cancel(gateway, "foo")
        expect(result).to eq(nil)
      end
    end

    describe "#create" do 
      it "creates a subscription" do 
        invoice = build(:invoice, payment_method_id: "foo", plan_id: "bar")
        # Freeze subscription ID generated from this invoice
        id = invoice.generate_subscription_id
        allow(invoice).to receive(:generate_subscription_id).and_return(id)
        fake_subscription = build(:subscription, id: id)
        subscription_hash = { 
          payment_method_token: "foo",
          plan_id: "bar",
          id: id
        }
        allow(gateway).to receive_message_chain(:subscription, create: success_result) # Setup method calls to gateway
        allow(success_result).to receive(:subscription).and_return(fake_subscription)
        allow(BraintreeService::Subscription).to receive(:normalize_subscription).with(gateway, fake_subscription).and_return(fake_subscription)
        expect(gateway.subscription).to receive(:create).with(subscription_hash).and_return(success_result)
        result = BraintreeService::Subscription.create(gateway, invoice)
        expect(result).to eq(fake_subscription)
      end

      it "creates a subscription with a discount" do 
        invoice = build(:invoice, payment_method_id: "foo", plan_id: "bar", discount_id: "discount")
        # Freeze subscription ID generated from this invoice
        id = invoice.generate_subscription_id
        allow(invoice).to receive(:generate_subscription_id).and_return(id)
        fake_subscription = build(:subscription, id: id)
        subscription_hash = { 
          payment_method_token: "foo",
          plan_id: "bar",
          id: id,
          discounts: { add: [{ inherited_from_id: "discount" }] }
        }
        allow(gateway).to receive_message_chain(:subscription, create: success_result) # Setup method calls to gateway
        allow(success_result).to receive(:subscription).and_return(fake_subscription)
        allow(BraintreeService::Subscription).to receive(:normalize_subscription).with(gateway, fake_subscription).and_return(fake_subscription)
        expect(gateway.subscription).to receive(:create).with(subscription_hash).and_return(success_result)
        result = BraintreeService::Subscription.create(gateway, invoice)
        expect(result).to eq(fake_subscription)
      end
    end

    describe "#read_id" do 
      it "parses resource class and ID from subscription ID correctly" do 
        invoice = build(:invoice)
        expect(BraintreeService::Subscription.read_id(invoice.generate_subscription_id)).to eq(["member", invoice.resource_id])
      end
    end

    describe "#set_resource" do 
      let(:member) { create(:member) }
      let(:member_2) { create(:member) }
      let(:rental) { create(:rental, member: member_2) }
      let(:invoice) { create(:invoice, member: member_2, resource_class: "rental", resource_id: rental.id) }
      let(:member_invoice) { create(:invoice, member: member, resource_class: "member", resource_id: member.id) }
      let(:rental_subscription) { build(:subscription, id: invoice.generate_subscription_id) }
      let(:member_subscription) { build(:subscription, id: member_invoice.generate_subscription_id) }
      
      it "initializes resource from subscription ID" do 
        rental_subscription.send(:set_resource)
        expect(rental_subscription.resource).to eq(rental)

        member_subscription.send(:set_resource)
        expect(member_subscription.resource).to eq(member)
      end

      it "sets associated member from resource" do 
        rental_subscription.send(:set_resource)
        member_subscription.send(:set_resource)
        expect(rental_subscription.member).to eq(member_2)
        expect(member_subscription.member).to eq(member)
      end
    end
  end
end