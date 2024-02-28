# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Brand, type: :model do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
  subject { FactoryBot.create(:brand, business: business) }
  
  describe 'Brand validation' do
    context 'with invalid record' do
      it "is not valid without a brand name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end
  
      it "is not valid without a description" do
        subject.description = nil
        expect(subject).to_not be_valid
      end
    end
    
    context 'with valid record' do
      it "is not valid without a brand name" do
        expect(subject).to be_valid
      end
  
      it "is not valid without a description" do
        expect(subject).to be_valid
      end
    end
  end
end

