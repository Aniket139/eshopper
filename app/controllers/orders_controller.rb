class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end
  
  def show
  end

  def create
    @order = current_customer.orders.new(create_order_params)
    @order.sub_total = current_customer.carts.sum { |item| item.product.price * item.quantity.to_i }
    @eco_tax = @order.sub_total * 2 / 100
    @shipping_cost = @order.sub_total > 1000 ? "free" : 50
    @order.total = @order.sub_total + @eco_tax + @shipping_cost.to_i

    if @order.save
      @order.order_products.create(
        mrp:
        price: 
        quantity:
      )

      flash[:success] = "Order was successfully created."
      redirect_to root_path
    else
      flash[:success] = "Order was not created."
    end
  end

  def check_out
    @order = current_customer.orders.new
    @product_id = params[:product_id]
    @product = Product.find_by(id: @product_id)
  end

  private

  def create_order_params
    params.require(:order).permit(:street, :landmark, :pincode,
                                  :city_id, :state_id, :country_id, :mobile, :payment_method)
  end
end