class OrdersController < ApplicationController
  def index
  end
  
  def show
  end

  def create
    @order = current_customer.orders.new(create_order_params)

    if @order.save
      flash[:success] = "Order was successfully created."
    else
      flash[:success] = "Order not create."
    end
  end

  private

  def create_order_params
    params.require(:order).permit(:street, :landmark, :pincode,
                                  :city_id, :state_id, :country_id, :mobile)
  end
end
