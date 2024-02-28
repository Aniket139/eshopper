# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
  let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state ) }
  let(:category) { FactoryBot.create(:category, business: business) } 
  let(:brand) { FactoryBot.create(:brand, business: business) } 
  let(:product) { FactoryBot.create(:product, category: category, brand: brand, business: business) } 
  let(:cart) { FactoryBot.create(:cart, customer: customer, product: product) }
  before { sign_in customer }

  describe 'GET index' do
    it 'assigns @carts and calculates total price' do
      get :index

      expect(assigns(:carts)).to eq(cart)
    end
  end

  describe 'POST create' do
    it 'creates a new cart' do
      expect {
        post :create, params: { product_id: product.id }
      }.to change(Cart, :count).by(1)
    end

    it 'does not create duplicate cart' do
      expect {
        post :create, params: { product_id: product.id }
      }.to change(Cart, :count).by(0)
      expect(flash[:alert]).to be_present
    end
  end

  describe 'PUT update' do
    it 'increases quantity' do
      put :update, params: { id: cart.id, type: 'increase' }
      cart.reload

      expect(cart.quantity).to eq(2)
    end

    it 'decreases quantity' do
      put :update, params: { id: cart.id, type: 'decrease' }
      cart.reload

      expect(cart.quantity).to eq(1)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the cart' do
      expect {
        delete :destroy, params: { id: cart.id }
      }.to change(Cart, :count).by(-1)
    end
  end
end
