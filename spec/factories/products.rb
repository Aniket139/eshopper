require 'faker'

FactoryBot.define do
  factory :product, class: 'Product' do
    name { Faker::Name.name[0..10] }
    description {Faker::Name.name[0..20]}
    mrp  { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    discount_type { 'Flat discount'}
    discount_value { %w[Fixed Percentage][rand(0..1)] }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    image { Faker::Image.image(width: 640, height: 480) }
    category
    brand
    business
    active  { Faker::Boolean.boolean }
    availability { %w[Instock OutOfStock][rand(0..2)] }
  end
end
