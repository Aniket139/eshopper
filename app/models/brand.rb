# frozen_string_literal: true

# :nodoc
class Brand < ApplicationRecord
  belongs_to :business
  has_many :products, dependent: :destroy
  
  validates :name, :description, presence: true
end
