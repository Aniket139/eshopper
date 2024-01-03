class CartController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_addcart, only: :show

  def index
  end

  def show
    @main_image = @cart.cover_image
  end
  
  private

  def set_addcart
    @cart = Product.find_by(id: 2)
    return unless @cart.blank?
 
    redirect_to products_path
   end
end
