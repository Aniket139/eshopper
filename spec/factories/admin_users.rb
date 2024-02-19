require 'faker'

FactoryBot.define do
  factory :admin_user, class: 'AdminUser' do
    email { Faker::Internet.email }
    password = "password"
    password { password }
  end
end
