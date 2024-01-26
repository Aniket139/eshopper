# frozen_string_literal: true

# :nodoc
class State < ApplicationRecord
  belongs_to :country
  has_many :cities
end
