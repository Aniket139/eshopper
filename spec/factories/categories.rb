require 'faker'

FactoryBot.define do
  factory :category, class: 'Category' do
    name { Faker::Name.name[0..10] }
    description {Faker::Name.name[0..20]}
    business
    active  { Faker::Boolean.boolean }
  end
end
