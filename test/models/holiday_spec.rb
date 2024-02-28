# frozen_string_literal: true

require 'rails_helper'


RSpec.describe Holiday, type: :model do 
  subject { FactoryBot.create(:holiday) }
  it "is not valid without a holiday name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "check name" do
    expect(subject.name).to eq(Holiday.last.name)
  end
end
