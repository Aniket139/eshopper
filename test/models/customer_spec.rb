# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
  subject { FactoryBot.create(:customer, country: country, state: state, city: city, business: business ) }
  
  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a duplicate email" do
    another_customer = FactoryBot.create(:customer, email: subject.email)
    expect(subject).to_not be_valid
  end

  it "is not valid with an invalid email format" do
    subject.email = "invalid_email"
    customers = Customer.all
  end
  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password confirmation" do
    subject.conform_password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if password and password confirmation do not match" do
    subject.password = "password"
    subject.conform_password = "different_password"
    expect(subject).to be_valid
  end
end

