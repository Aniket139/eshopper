require 'faker'

FactoryBot.define do
  factory :business, class: 'Business' do
    name { Faker::Name.name[0..10] }
    country
    state
    city
    email { Faker::Internet.email }
    mobile { Faker::PhoneNumber.cell_phone }
    pincode { Faker::Address.zip_code } 
    street { Faker::Address.street_address }
    landmark { Faker::Address.community }
  end
end
