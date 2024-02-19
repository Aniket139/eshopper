# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:state) { FactoryBot.create(:state) } 
  subject { FactoryBot.create(:city, state: state) }
  it "is not valid without a city name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "check name" do
    expect(subject.name).to eq(City.last.name)
  end
end
