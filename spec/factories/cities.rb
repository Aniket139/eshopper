require 'faker'

FactoryBot.define do
  factory :city, class: 'City' do
    name { Faker::Name.name[0..10] }
    state
  end
end
