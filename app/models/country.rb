# frozen_string_literal: true

# :nodoc
class Country < ApplicationRecord
  has_many :states
  validates :name, presence: true
end
