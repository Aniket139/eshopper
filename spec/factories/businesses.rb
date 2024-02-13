require 'faker'

FactoryBot.define do
  factory :businesses, class: 'Business' do
    name { Faker::Name.name[0..10] }
  end
end
