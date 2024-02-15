# frozen_string_literal: true

# :nodoc
class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :business
  has_many :order_products
  has_many :carts, dependent: :destroy

  has_many_attached :images

  validate :validate_max_images
  validates :name, :description, :mrp, presence: true
  validates :price, numericality: { greater_than: 0 }

  def validate_max_images
    return unless images.count > 4

    errors.add(:images, 'cannot exceed 4 images')
  end

  def cover_image
    images.find_by(cover: true) || images.first
  end
end
