# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :order
end
