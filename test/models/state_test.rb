# frozen_string_literal: true

require 'rails_helper'

# :nodoc
class StateTest < ActiveSupport::TestCase
  RSpec.describe State, type: :model do
    let(:country) { FactoryBot.create(:countries) } 
    subject { FactoryBot.create(:states, country: country) }
    it "is not valid without a state name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "check name" do
      expect(subject.name).to eq(State.last.name)
    end
  end
end