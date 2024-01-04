class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :city
  belongs_to :state
  belongs_to :country
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
end
