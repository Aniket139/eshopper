# frozen_string_literal: true

# :nodoc
class Category < ApplicationRecord
  belongs_to :business

  validates :name, :description, presence: true
end
