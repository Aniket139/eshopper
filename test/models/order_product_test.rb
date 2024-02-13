# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class OrderProductTest < ActiveSupport::TestCase
  RSpec.describe OrderProduct, type: :model do
    let(:customer) { FactoryBot.create(:customers) } 
    let(:product) { FactoryBot.create(:products) } 
    let(:order) { FactoryBot.create(:orders) } 
    subject { FactoryBot.create(:order_products, product: product, order: order) }
  end
end
