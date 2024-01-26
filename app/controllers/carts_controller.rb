# frozen_string_literal: true

# :nodoc
class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create update]
  before_action :authenticate_customer!
  before_action :set_cart, only: %i[update destroy]

  def index
    @carts = current_customer.carts
    @total_cart_price = @carts.sum { |item| item.product.price * item.quantity.to_i }
    @eco_tax = @total_cart_price * 2 / 100
    @shipping_cost = @total_cart_price > 1000 ? 'free' : 50
    @total_price = @total_cart_price + @eco_tax + @shipping_cost.to_i
  end

  def create
    @cart = current_customer.carts.new(product_id: params[:product_id])
    if @cart.save
      flash[:success] = 'Product added to cart successfully!'
    elsif current_customer.carts.exists?(product_id: params[:product_id])
      flash[:alert] = 'Product already exists in the cart.'
    end
    respond_to do |format|
      format.js { render inline: 'window.location.reload();' }
    end
  end

  def update
    if params[:type] == 'increase'
      @cart.update(quantity: @cart.quantity.to_i + 1)
      flash[:success] = 'Quantity updated successfully!'
    elsif params[:type] == 'decrease' && @cart.quantity > 1
      @cart.update(quantity: @cart.quantity.to_i - 1)
      flash[:success] = 'Quantity updated successfully!'
    end
    respond_to do |format|
      format.js { render inline: 'window.location.reload();' }
    end
  end

  def destroy
    @cart.destroy
    redirect_to carts_path
  end

  private

  def set_cart
    @cart = current_customer.carts.find_by(id: params[:id])
    return if @cart.present?

    redirect_to carts_path
  end
end
