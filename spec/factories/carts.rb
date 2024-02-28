require 'faker'

FactoryBot.define do
  factory :cart, class: 'Cart' do
    customer
    product
    quantity { Faker::Number.within(range: 1..10) }
  end
end
