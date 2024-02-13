# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class BrandTest < ActiveSupport::TestCase
  RSpec.describe Brand, type: :model do
    let(:business) { FactoryBot.create(:businesses) } 
    subject { FactoryBot.create(:brands, business: business) }
    it "is not valid without a brand name" do
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
      expect(subject.name).to eq(Brand.last.name)
    end
  end
end
