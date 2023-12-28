class ProductsController < ApplicationController
   before_action :set_defualt_data
   before_action :set_product, only: :show

   def index
     @products = Product.all
     @products = @products.where(brand: params[:brand]) if params[:brand].present?
     @products = @products.where(category_id: params[:category]) if params[:category].present?
     respond_to do |format|
      format.html
      format.js
    end
  
   end

   def show
     @main_image = @product.cover_image
     @sub_images = @product.images.reject { |image| image == @main_image }
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
