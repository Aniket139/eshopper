# frozen_string_literal: true

require 'rails_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe CustomerController, type: :controller do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
    let(:customer) { FactoryBot.create(:customer, country: country, state: state, city: city, business: business) }
    
    describe 'GET #show' do
      context "when customer is authenticated" do
        before do
          @customer = FactoryBot.create(:customer, country: country, state: state, city: city, business: business)
          sign_in @customer
        end

        it 'assigns the requested customer to @customer' do
          get :show
          expect(assigns(:customer)).to eq(@customer)
        end

        it 'renders the show template' do
          get :show
          expect(response).to render_template(:show)
        end
      end

      describe 'GET #edit' do
        it 'assigns the requested customer to @customer' do
          get :edit
          expect(assigns(:customer)).to eq(customer)
        end

        it 'renders the edit template' do
          get :edit
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        it 'updates the customer attributes' do
          patch :update, params: { id: customer.id, customer: { first_name: 'John', last_name: 'Doe' } }
          customer.reload
          expect(customer.first_name).to eq('John')
          expect(customer.last_name).to eq('Doe')
        end

        it "flashes a success message" do
          expect( subject.request.flash[:success] ).to_not be_nil
        end
      end
    end
  end
end
