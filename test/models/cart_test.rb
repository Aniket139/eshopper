# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class CartTest < ActiveSupport::TestCase
  RSpec.describe Cart, type: :model do
    let(:customer) { FactoryBot.create(:customers) }
    let(:product) { FactoryBot.create(:products) }
    subject { FactoryBot.create(:carts, customer: customer, product: product) }
  end
end
