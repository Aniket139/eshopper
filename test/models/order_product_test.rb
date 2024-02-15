# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class OrderProductTest < ActiveSupport::TestCase
  RSpec.describe OrderProduct, type: :model do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state ) }
    let(:category) { FactoryBot.create(:category, business: business) } 
    let(:brand) { FactoryBot.create(:brand, business: business) } 
    let(:product) { FactoryBot.create(:product, category: category, brand: brand, business: business) } 
    let(:order) { FactoryBot.create(:order, customer: customer, city: city, state: state, country: country ) }
    subject { FactoryBot.create(:order_product, product: product, order: order) }
  end
end
