# frozen_string_literal: true

# :nodoc
class Business < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :country

  validates :name, presence: true
  
  def address
    "#{street} #{landmark} #{city.name} #{state.name} #{country.name} #{pincode}"
  end
end
