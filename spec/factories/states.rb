require 'faker'

FactoryBot.define do
  factory :state, class: 'State' do
    name { Faker::Name.name[0..10] }
    country
  end
end
