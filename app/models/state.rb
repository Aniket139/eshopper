# frozen_string_literal: true

# :nodoc
class State < ApplicationRecord
  belongs_to :country
  has_many :cities

  validates :name, presence: true
end
