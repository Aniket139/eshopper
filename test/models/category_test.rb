# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class CategoryTest < ActiveSupport::TestCase
  RSpec.describe Category, type: :model do
    let(:business) { FactoryBot.create(:businesses) } 
    subject { FactoryBot.create(:categories, business: business) }
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