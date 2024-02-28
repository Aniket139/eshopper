# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Business, type: :model do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  subject { FactoryBot.create(:business, city: city, country: country, state: state) }
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
        expect(subject.address).to eq(subject.address)
      end
    end
  end
end

