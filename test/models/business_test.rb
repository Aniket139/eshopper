# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class BusinessTest < ActiveSupport::TestCase
  RSpec.describe Business, type: :model do
    subject { FactoryBot.create(:business) }
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "check name" do
      expect(subject.name).to eq(Business.last.name)
    end

    describe 'Business address' do
      context 'address method returns a formatted address' do
        it "returns the correct address" do
          expect(business.address).to eq(business.address)
        end
      end
    end
  end
end
