require 'faker'

FactoryBot.define do
  factory :holiday, class: 'Holiday' do
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) } 
    name { Faker::Name.name[0..10] }
    active { Faker::Boolean.boolean }
  end
end
