class CartController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart

  def index
    @carts = current_customer.carts
  end

  def create
    @cart = current_customer.carts.new(product_id: product.id)
    if @cart.save
      flash[:success] = "Product added to cart successfully!"
    else
      flash[:alert] = ""
    end
    respond_to do |format|
      format.js { render inline: "window.location.reload();" }
    end
  end

  def update
    if @cart.update(quantity: params[:quantity])
      flash[:success] = ""
    else
      flash[:alert] = ""
    end
    respond_to do |format|
      format.js { render inline: "window.location.reload();" }
    end
  end

  def destory
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
