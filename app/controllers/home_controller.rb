class HomeController < ApplicationController
  before_action :set_defualt_data

  def index
    @products = Product.all
  end

  private

  def set_defualt_data
    @categories = Category.pluck(:name)
    @brands = Brand.all
  end
end
