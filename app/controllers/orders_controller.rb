# frozen_string_literal: true

# :nodoc
class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_order, only: %i[show cancel_information cancel confirmation]

  def index
    @orders = current_customer.orders
  end

  def show
    @order_details = @order.order_products.includes(:product)
    @order_created_at = @order.created_at
    @delivery_date = (@order_created_at + 6.days).strftime('%A, %d %B, %Y')
  end

  def create
    @order = current_customer.orders.new(create_order_params)
    if @order.product_id.present?
      @product = Product.find_by(id: @order.product_id)
      @order.sub_total = @product.price
    else
      @order.sub_total = current_customer.carts.sum { |item| item.product.price * item.quantity.to_i }
    end
    @eco_tax = @order.sub_total * 2 / 100
    @shipping_cost = @order.sub_total > 1000 ? 'free' : 50
    @order.total = @order.sub_total + @eco_tax + @shipping_cost.to_i

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
      flash[:success] = 'Order was successfully created.'
      OrdersMailer.confirmation(@order).deliver_later
      redirect_to confirmation_order_path(@order)
    else
      flash[:success] = 'Order was not created.'
    end
  end

  def check_out
    @order = current_customer.orders.new
    @product = Product.find_by(id: params[:product_id])
  end

  def cancel_information
    @order_details = @order.order_products.includes(:product)
  end

  def confirmation
    @order_details = @order.order_products.includes(:product)
  end

  def cancel
    @order.status = 'cancelled'
    if @order.update(cancel_params)
      flash[:success] = 'Order Cancelled'
      OrdersMailer.cancel(@order).deliver_later
    else
      flash[:error] = 'Failed to cancel order'
    end
    redirect_to root_path
  end

  private

  def create_order_params
    params.require(:order).permit(:street, :landmark, :pincode,
                                  :city_id, :state_id, :country_id, :mobile, :payment_method, :product_id, :status)
  end

  def cancel_params
    params.require(:order).permit(:cancel_reason)
  end

  def set_order
    @order = Order.find_by(id: params[:id])
  end
end
