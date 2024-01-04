# frozen_string_literal: true

module Authentication
  class SessionsController < Devise::SessionsController
    # def create
    #   customer = params[:customer]

    #   resource = Customer.find_for_database_authentication(
    #     email: customer[:email]
    #   )
      
    #   if resource&.valid_password?(customer[:password]) && resource&.active
    #     sign_in :customer, resource
    #     flash[:success] = 'Login successfully.'
    #     redirect_to authenticated_customer_path(resource)
    #   else
    #     flash[:alert] = 'Invalid Credentials.'
    #     redirect_to root_path
    #   end
    # end
  end
end