# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :states
end
