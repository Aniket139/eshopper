# spec/controllers/home_controller_spec.rb
require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
  let(:category) { FactoryBot.create(:category, business: business) } 
  let(:brand) { FactoryBot.create(:brand, business: business) } 
  describe 'GET #index' do
    it 'assigns @products to all products' do
      products = FactoryBot.create(:product, category: category, brand: brand, business: business)
      get :index
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'before_action :set_default_data' do
    it 'assigns @categories to all categories' do
      categories = Category.all
      get :index
    end

    it 'assigns @brands to all brands' do
      brands = Brand.all
      get :index
    end
  end
end
