class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end
  
  def show
  end

  def create
    @order = current_customer.orders.new(create_order_params)
    if @order.product_id.present?
      @product = Product.find_by(id: @order.product_id)
      @order.sub_total = @product.price
      @eco_tax = @order.sub_total * 2 / 100
      @shipping_cost = @order.sub_total > 1000 ? "free" : 50
      @order.total = @order.sub_total + @eco_tax + @shipping_cost.to_i
    else
      @order.sub_total = current_customer.carts.sum { |item| item.product.price * item.quantity.to_i }
      @eco_tax = @order.sub_total * 2 / 100
      @shipping_cost = @order.sub_total > 1000 ? "free" : 50
      @order.total = @order.sub_total + @eco_tax + @shipping_cost.to_i
    end

    if @order.save
      if @order.product_id.present?
        # process of product
        @order.order_products.create(
          customer_id: current_customer.id,
          product_id: @product.id,
          mrp: @product.mrp,
          discount_type: @product.discount_type,
          discount_value: @product.discount_value,
          price: @product.price,
          quantity: 1
        )    
      else
        # process of cart
        carts = current_customer.carts.includes(:product)
        carts.each do |cart|
          @order.order_products.create(
            customer_id: current_customer.id,
            product_id: cart.product_id,
            mrp: cart.product.mrp,
            discount_type: cart.product.discount_type,
            discount_value: cart.product.discount_value,
            price: cart.product.price,
            quantity: cart.quantity
          )    
        end
        carts.destroy_all
      end
      flash[:success] = "Order was successfully created."
      redirect_to root_path
    else
      flash[:success] = "Order was not created."
    end
  end

  def check_out
    @order = current_customer.orders.new
    @product = Product.find_by(id: params[:product_id])
  end

  private

  def create_order_params
    params.require(:order).permit(:street, :landmark, :pincode,
                                  :city_id, :state_id, :country_id, :mobile, :payment_method, :product_id)
  end
end