# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class CategoryTest < ActiveSupport::TestCase
  RSpec.describe Category, type: :model do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
    subject { FactoryBot.create(:category, business: business) }
    it "is not valid without a Category name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    
    it "business name" do
    end

    it "check name" do
      expect(subject.name).to eq(Category.last.name)
    end
  end
end