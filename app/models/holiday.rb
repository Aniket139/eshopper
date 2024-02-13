# frozen_string_literal: true

class Holiday < ApplicationRecord
  validates :name, presence: true  
end
