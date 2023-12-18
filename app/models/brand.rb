class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :business
end
