class ProductsController < ApplicationController
   before_action :set_defualt_data
   before_action :set_product, only: :show

   def index
      @products = Product.all
   end

   def show
   end

   private

  def set_defualt_data
    @categories = Category.pluck(:name)
    @brands = Brand.all
  end

  def set_product
   @product = Product.find_by(id: params[:id])
   return unless @product.blank?

   redirect_to products_path
  end
end
