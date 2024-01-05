class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :authenticate_customer!
  before_action :set_cart, only: %i[update destroy]

  def index
    @carts = current_customer.carts
  end
  
  def create
    @cart = current_customer.carts.new(product_id: params[:product_id])
    if @cart.save
      flash[:success] = "Product added to cart successfully!"
    else
      flash[:alert] = "Product not add to cart"
    end
    respond_to do |format|
      format.js { render inline: "window.location.reload();" }
    end
  end

  def update
    if @cart.update(quantity: params[:quantity])
      flash[:success] = "upadate"
    else
      flash[:alert] = "not upadate"
    end
    respond_to do |format|
      format.js { render inline: "window.location.reload();" }
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
