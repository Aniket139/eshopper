# frozen_string_literal: true

# :nodoc
class ProductsController < ApplicationController
  before_action :set_defualt_data
  before_action :set_product, only: :show

  def index
    @products = Product.all
    @products = @products.where(brand_id: params[:brand_id]) if params[:brand_id].present?
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @products = @products.where('price >= ?', params[:min_price])  if params[:min_price].present?
    @products = @products.where('price <= ?', params[:max_price])  if params[:max_price].present?
    @products = @products.where('name LIKE ?', "%#{params[:name]}%") if params[:name].present?
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
    @categories = Category.all
    @brands = Brand.all
  end

  def set_product
    @product = Product.find_by(id: params[:id])
    return unless @product.blank?

    redirect_to products_path
  end
end
