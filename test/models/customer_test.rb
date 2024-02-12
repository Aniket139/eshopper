# frozen_string_literal: true

require 'rails_helper'

class CustomerTest < ActiveSupport::TestCase
  RSpec.describe Customer, type: :model do
    subject { Customer.new(first_name: "Jack", middle_name: "Smith", last_name: "Jone", mobile: "8889995678", email: "jsmith@sample.com", password: "dhvfduj", city_id: 1, state_id: 2, country_id: 2, business_id: 1)}
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a first_name" do
      expect(subject).to_not be_valid
    end
    it "is not valid without a last_name" do
      expect(subject).to_not be_valid
    end
  end
end
