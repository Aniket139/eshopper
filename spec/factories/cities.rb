require 'faker'

FactoryBot.define do
  factory :cities, class: 'City' do
    name { Faker::Name.name[0..10] }
    state
  end
end
