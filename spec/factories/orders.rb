require 'faker'

FactoryBot.define do
  factory :order, class: 'Order' do
    customer
    street { Faker::Address.street_address } # Random street address
    pincode { Faker::Address.zip_code } # Random pincode
    landmark { Faker::Address.community } # Random landmark
    city
    state
    country
    mobile { Faker::PhoneNumber.cell_phone } # Random mobile number
    status { %w[Pending Shipped Delivered][rand(0..2)] } # Random order status
    payment_method { %w[CreditCard CashOnDelivery][rand(0..3)] } # Random payment method
    cancel_by { Faker::Name.name } # Random canceled
    cancel_reason { Faker::Lorem.sentence } # Random cancellation reason
    delivery_notes { Faker::Lorem.paragraph } # Random delivery notes
    payment_details { Faker::Lorem.sentence } # Random payment details
    sub_total { Faker::Commerce.price(range: 50..200) } # Random sub-total
    discount_type { %w[Fixed Percentage][rand(0..1)] } # Random discount type
    discount_value { Faker::Number.decimal(l_digits: 2, r_digits: 2) } # Random discount value
    total { Faker::Commerce.price(range: 1000..3000) } # Random total amount
  end
end