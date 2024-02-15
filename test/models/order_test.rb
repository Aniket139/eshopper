# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class OrderTest < ActiveSupport::TestCase
  RSpec.describe Order, type: :model do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state ) } 
    subject { FactoryBot.create(:order, customer: customer, city: city, state: state, country: country ) }

    it "is not valid without values" do
      subject.street = nil
      subject.pincode = nil
      subject.landmark = nil
      subject.mobile = nil
      subject.payment_method = nil
      expect(subject).to_not be_valid
    end
  end
end
