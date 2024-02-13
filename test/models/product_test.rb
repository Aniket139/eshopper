# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class ProductTest < ActiveSupport::TestCase
  RSpec.describe Product, type: :model do
    let(:category) { FactoryBot.create(:categories) } 
    let(:brand) { FactoryBot.create(:brands) } 
    let(:business) { FactoryBot.create(:businesses) } 
    subject { FactoryBot.create(:product, category: category, brand: brand, business: business) }
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "check name" do
      expect(subject.name).to eq(Country.last.name)
    end
  end
end
