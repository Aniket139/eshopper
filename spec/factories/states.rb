require 'faker'

FactoryBot.define do
  factory :states, class: 'State' do
    name { Faker::Name.name[0..10] }
    country
  end
end
