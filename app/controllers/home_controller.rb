class HomeController < ApplicationController
  def index
      @categories = Category.pluck(:name)
      @brands = Brand.all
      @products = Product.all
  end
  
  def show
    @categories = Category.pluck(:name)
    @brands = Brand.all
    @product = Product.find(params[:id])
  end
end
