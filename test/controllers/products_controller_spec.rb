require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
  let(:category) { FactoryBot.create(:category, business: business) } 
  let(:brand) { FactoryBot.create(:brand, business: business) } 
  subject { FactoryBot.build(:product, category: category, brand: brand, business: business) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested product as @product" do
      get :show, params: { id: 1 }
      expect(assigns(:product)).to eq(1)
    end
  end

  describe "GET #show" do
    it "assigns the main_image and sub_images variables" do
    end
  end
end
