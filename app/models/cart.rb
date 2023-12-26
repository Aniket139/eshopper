class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def cover_image
    images.find_by(cover: true) || images.first
  end 
end
