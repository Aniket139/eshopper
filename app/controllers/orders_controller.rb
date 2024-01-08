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
    params.require(:order).permit(:first_name, :middle_name, :last_name, :email,
                                  :mobile, :street, :landmark, :pincode,
                                  :city_id, :state_id, :country_id)
  end
end
