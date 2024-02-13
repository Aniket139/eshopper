require 'faker'

FactoryBot.define do
  factory :order_products, class: 'OrderProduct' do
    customer
    product
    order
    mrp { Faker::Commerce.price(range: 100..1000) }
    discount_type { Faker::Boolean.boolean ? "percentage" : "amount" }
    discount_value { Faker::Number.between(from: 10, to: 50) || Faker::Commerce.price(range: 10..100) }
    price { mrp * (1 - discount_value / 100.0) || mrp - discount_value }
    quantity { Faker::Number.within(range: 1..10) }
  end
end
