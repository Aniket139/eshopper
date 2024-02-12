require 'faker'
FactoryBot.define do
  factory :countries, class: 'Country' do
    name { Faker::Name.name[0..10] }
  end
end
