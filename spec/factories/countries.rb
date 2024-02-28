require 'faker'

FactoryBot.define do
  factory :country, class: 'Country' do
    name { Faker::Name.name[0..10] }
  end
end
