# frozen_string_literal: true

require 'rails_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe CustomerController, type: :controller do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
    let(:customer) { create(:customer, country: country, state: state, city: city, business: business) }4
    
    describe 'GET #show' do
      it 'assigns the requested customer to @customer' do
        get :show, params: { id: customer.id }
        expect(assigns(:customer)).to eq(customer)
      end

      it 'renders the show template' do
        get :show, params: { id: customer.id }
        expect(response).to render_template(:show)
      end
    end

    # Test the edit action
    describe 'GET #edit' do
      it 'assigns the requested customer to @customer' do
        get :edit, params: { id: customer.id }
        expect(assigns(:customer)).to eq(customer)
      end

      it 'renders the edit template' do
        get :edit, params: { id: customer.id }
        expect(response).to render_template(:edit)
      end
    end

    # Test the update action
    describe 'PATCH #update' do
      context 'with valid attributes' do
        it 'updates the customer attributes' do
          patch :update, params: { id: customer.id, customer: { first_name: 'John', last_name: 'Doe' } }
          customer.reload
          expect(customer.first_name).to eq('John')
          expect(customer.last_name).to eq('Doe')
        end

        it 'redirects to the customer show page' do
          patch :update, params: { id: customer.id, customer: { first_name: 'John', last_name: 'Doe' } }
          expect(response).to redirect_to(customer)
        end

        it 'flashes a success message' do
          patch :update, params: { id: customer.id, customer: { first_name: 'John', last_name: 'Doe' } }
          expect(flash[:success]).to eq('Profile successfully updated')
        end
      end

      context 'with invalid attributes' do
        it 'does not update the customer attributes' do
          patch :update, params: { id: customer.id, customer: { first_name: '', last_name: '' } }
          customer.reload
          expect(customer.first_name).not_to eq('')
          expect(customer.last_name).not_to eq('')
        end

        it 'renders the edit template' do
          patch :update, params: { id: customer.id, customer: { first_name: '', last_name: '' } }
          expect(response).to render_template(:edit)
        end

        it 'returns an unprocessable entity status' do
          patch :update, params: { id: customer.id, customer: { first_name: '', last_name: '' } }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
