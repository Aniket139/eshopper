# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 

  before(:each) do
    @customer = FactoryBot.create(:customer, country: country, state: state, city: city, business: business)
    sign_in @customer
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end

    it 'renders the show template' do
      get :show, params: { id: @customer.id }
      expect(assigns(:customer.id)).to eq(@customer.id)
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      get :edit, params: { id: @customer.id}
      expect(response).to render_template(:edit)
    end
  end
  describe 'PATCH #update' do
    it 'updates the customer profile' do
      patch :update, params: { customer: { first_name: 'John', last_name: 'Doe' } }
      expect(response).to redirect_to(@customer)
      expect(flash[:success]).to be_present

      @customer.reload
      expect(@customer.first_name).to eq('John')
      expect(@customer.last_name).to eq('Doe')
    end

    it 're-renders the edit template if update fails' do
      patch :update, params: { customer: { first_name: '', last_name: 'Doe' } }
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    # add more tests for specific behavior
  end
end

