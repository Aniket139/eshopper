class CartController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_addcart, only: :show

  def index
  end

  def show
    @main_image = @product_cart.cover_image
  end
  
  private

  def set_addcart
    @product_cart = Product.find_by(id: params[:id])
    return unless @product_cart.blank?
 
    redirect_to products_path
   end
end
