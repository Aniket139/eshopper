class Customer < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :business
end
