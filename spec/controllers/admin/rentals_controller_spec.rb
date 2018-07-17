require 'rails_helper'

RSpec.describe Admin::RentalsController, type: :controller do

  let(:member) { create(:member)}

  let(:valid_attributes) {
    { number: '1',
      member_id: member.id,
      expiration: (Time.now + 1.month)
    }
  }

  let(:invalid_attributes) {
    {
      number: nil,
      expiration: Time.now
    }
  }

  login_admin

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Rental" do
        expect {
          post :create, params: {rental: valid_attributes}, format: :json
        }.to change(Rental, :count).by(1)
      end

      it "assigns a newly created rental as @rental" do
        post :create, params: {rental: valid_attributes}, format: :json
        expect(assigns(:rental)).to be_a(Rental)
        expect(assigns(:rental)).to be_persisted
      end

      it "renders json of the created rental" do
        post :create, params: {rental: valid_attributes}, format: :json

        parsed_response = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq "application/json"
        expect(parsed_response['id']).to eq(Rental.last.id.to_s)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved rental as @rental" do
        post :create, params: {rental: invalid_attributes}, format: :json
        expect(assigns(:rental)).to be_a_new(Rental)
      end

      it "returns status 500" do
        post :create, params: {rental: invalid_attributes}, format: :json
        expect(response).to have_http_status(500)
        expect(response.content_type).to eq "application/json"
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          expiration: (Time.now + 2.months)
        }
      }
      it "updates the requested rental" do
        rental = Rental.create! valid_attributes
        put :update, params: {id: rental.to_param, rental: new_attributes}, format: :json
        rental.reload
        expect(rental.getExpiration).to eq(Time.parse(new_attributes[:expiration].to_s))
      end

      it "renders json of the rental" do
        rental = Rental.create! valid_attributes
        put :update, params: {id: rental.to_param, rental: new_attributes}, format: :json

        parsed_response = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq "application/json"
        expect(parsed_response['id']).to eq(rental.id.as_json)
      end

      it "Sends slack notification if member renewed" do
        rental = Rental.create! valid_attributes
        slack_msg = "msg"
        Slack::Notifier.any_instance.stub(:ping)
        Slack::Notifier::Util::LinkFormatter.stub(:format).and_return(slack_msg)
        put :update, params: {id: rental.to_param, rental: new_attributes}, format: :json
        member.reload
        expect(assigns(:notifier)).to be_a(Slack::Notifier)
        expect(Slack::Notifier::Util::LinkFormatter).to have_received(:format).with(assigns(:messages).join("\n"))
        expect(assigns(:notifier)).to have_received(:ping).with(slack_msg)
      end
    end
  end
end
