require 'faker'

FactoryBot.define do
  factory :admin_user, class: 'AdminUser' do
    email { Faker::Internet.email }
    password = "password"
    password { password }
    conform_password { password }
  end
end
