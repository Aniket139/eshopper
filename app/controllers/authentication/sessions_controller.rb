# frozen_string_literal: true

module Authentication
  class SessionsController < Devise::SessionsController
    # def create
    #   resource = Customer.find_by(email: params[:customer][:email])
    #   put ""
    #   if resource&.valid_password?(params[:password])
    #     sign_in :customer, resource
    #     flash[:success] = 'Login successfully.'
    #   else
    #     flash[:alert] = 'Invalid Credentials.'
    #   end
    #   redirect_to root_path
    # end
  end
end
