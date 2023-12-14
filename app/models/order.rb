class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :city
  belongs_to :state
  belongs_to :country
end
