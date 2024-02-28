require 'rails_helper'

RSpec.describe Authentication::RegistrationsController, type: :controller do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
  let(:customer) { FactoryBot.create(:customer, country: country, state: state, city: city, business: business) }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:customer]
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new customer" do
        expect {
          post :create
        }.to change(Customer, :count).by(1)
      end

      it "sets a flash message" do
        post :create
        expect(flash[:success]).to eq('Signup successful!')
      end

      it "sends a confirmation email to the customer" do
        expect {
          post :create
        }.to change(ActionMailer::Base.deliveries, :count).by(1)
      end

      it "enqueues a job to fill customer's data" do
        expect {
          post :create
        }.to have_enqueued_job(FillCustomersAllDataJob)
      end

      it "redirects to the root path" do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
