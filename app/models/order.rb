class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :city
  belongs_to :state
  belongs_to :country
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  enum status: {
    order_confirmed: 'Order Confirmed',
    picked_by_courier: 'Picked by courier',
    on_the_way: 'On the way',
    out_for_delivery: 'Out for delivery',
    delivered: 'Delivered',
    cancelled: "Cancelled"
  }

  attr_accessor :product_id
end
