# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
  let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state ) }
  let(:category) { FactoryBot.create(:category, business: business) } 
  let(:brand) { FactoryBot.create(:brand, business: business) } 
  let(:product) { FactoryBot.create(:product, category: category, brand: brand, business: business) } 
  subject { FactoryBot.create(:cart, customer: customer, product: product) }

  it { should belong_to(:customer) }
  it { should belong_to(:product) }

  it { should validate_uniqueness_of(:product_id).with_message('Product already added to cart') }

  describe '#cover_image' do
    context 'when the product has a cover image' do
      it 'returns the cover image' do
        cover_image = product.images
        expect(subject.cover_image).to eq(cover_image)
      end
    end
  end
end

