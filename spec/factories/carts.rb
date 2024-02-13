require 'faker'

FactoryBot.define do
  factory :carts, class: 'Cart' do
    customer
    product
    quantity { Faker::Number.within(range: 1..10) }
  end
end
