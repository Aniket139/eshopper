# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :product_id, uniqueness: { message: 'Product already added to cart' }

  def cover_image
    images.find_by(cover: true) || images.first
  end
end
