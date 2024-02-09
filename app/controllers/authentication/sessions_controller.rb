# frozen_string_literal: true

# :nodoc
module Authentication
  class SessionsController < Devise::SessionsController
    def create
      customer = Customer.find_by(email: params[:customer][:email])
      if customer&.valid_password?(params[:customer][:password])
        sign_in :customer, customer
        customer.redis_cache
        session[:cart] = current_customer.carts
        session[:cart_count] = current_customer.carts.count 
        flash[:success] = 'Login successfully.'
      else
        flash[:alert] = 'Invalid Credentials.'
      end
      redirect_to root_path
    end
  end
end
