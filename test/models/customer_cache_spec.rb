# spec/models/customer_cache_spec.rb
require 'rails_helper'

RSpec.describe CustomerCache, type: :model do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state ) } 
  let(:redis_key) { "customer_#{customer.id}" }
end
