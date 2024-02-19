# frozen_string_literal: true

require 'rails_helper'


RSpec.describe Country, type: :model do
  subject { FactoryBot.create(:country) }
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "check name" do
    expect(subject.name).to eq(Country.last.name)
  end
end
