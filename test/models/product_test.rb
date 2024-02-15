# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class ProductTest < ActiveSupport::TestCase
  RSpec.describe Product, type: :model do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
    let(:category) { FactoryBot.create(:category, business: business) } 
    let(:brand) { FactoryBot.create(:brand, business: business) } 
    subject { FactoryBot.create(:product, category: category, brand: brand, business: business) }
    
    it "is not valid without value" do
      subject.name = nil
      subject.description = nil
      subject.mrp = nil
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a negative price" do
      subject.price = -1
      expect(subject).to_not be_valid
    end
  end
end
