# spec/controllers/authentication/sessions_controller_spec.rb
require 'rails_helper'

RSpec.describe Authentication::SessionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
  let(:customer) { FactoryBot.create(:customer, country: country, state: state, city: city, business: business) }

  describe 'POST #create' do
    context 'with valid email and password' do
      it 'signs in the customer and redirects to the root path' do
        post :create
        expect(controller.current_customer).to eq(customer)
        expect(session[:cart]).to eq(customer.carts)
        expect(session[:cart_count]).to eq(customer.carts.count)
        expect(flash[:success]).to eq('Login successfully.')
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid email or password' do
      it 'does not sign in the customer and renders the new template' do
        post :create, params: { customer: { email: customer.email, password: 'wrongpassword' } }
        expect(controller.current_customer).to be_nil
        expect(session[:cart]).to be_nil
        expect(session[:cart_count]).to be_nil
        expect(flash[:alert]).to eq('Invalid Credentials.')
        expect(response).to render_template 'devise/sessions/new'
      end
    end
  end
end
