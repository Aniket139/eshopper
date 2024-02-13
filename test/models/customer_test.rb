# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class CustomerTest < ActiveSupport::TestCase
  RSpec.describe Customer, type: :model do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
    subject { FactoryBot.create(:customer, country: country, state: state, city: city, business: business ) }
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a full name" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a last_name" do
      expect(subject).to_not be_valid
    end
  end
end
