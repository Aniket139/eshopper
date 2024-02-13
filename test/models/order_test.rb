# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class OrderTest < ActiveSupport::TestCase
  RSpec.describe Order, type: :model do
    let(:customer) { FactoryBot.create(:customers) } 
    let(:city) { FactoryBot.create(:cities) } 
    let(:state) { FactoryBot.create(:states) } 
    let(:country) { FactoryBot.create(:countries) } 
    subject { FactoryBot.create(:orders, customer: customer, city: city, state: state, country: country ) }
  end
end
