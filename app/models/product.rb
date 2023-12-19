class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :business

  has_many_attached :images
  
  def cover_image
    images.find_by(cover: true)
  end 
end