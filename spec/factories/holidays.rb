require 'faker'

FactoryBot.define do
  factory :holiday, class: 'Holiday' do
    date { Date.today }
    name { Faker::Name.name[0..10] }
    active { Faker::Boolean.boolean }
  end
end
