# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class CustomerTest < ActiveSupport::TestCase
  RSpec.describe Customer, type: :model do
    let(:country) { FactoryBot.create(:countries) } 
    let(:state) { FactoryBot.create(:states) } 
    let(:city) { FactoryBot.create(:cities) }
    let(:business) { FactoryBot.create(:businesses) }
    subject { FactoryBot.create(:customers, country: country, state: state, city: city ) }
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a full name" do
      subject.first_name = nil
      subject.middle_name = nil
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a last_name" do
      expect(subject).to_not be_valid
    end
  end
end
