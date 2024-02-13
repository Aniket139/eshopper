require 'faker'

FactoryBot.define do
  factory :customer, class: 'Customer' do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    mobile { Faker::PhoneNumber.cell_phone }
    street { Faker::Address.street_address }
    landmark { Faker::Address.community }
    pincode { Faker::Address.zip_code }
    city
    state
    country
    business
    password { Faker::Internet.password }
    conform_password { Faker::Internet.password }
    dob { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
