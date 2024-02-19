# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State, type: :model do
  let(:country) { FactoryBot.create(:country) } 
  subject { FactoryBot.create(:state, country: country) }
  it "is not valid without a state name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "check name" do
    expect(subject.name).to eq(State.last.name)
  end
end
