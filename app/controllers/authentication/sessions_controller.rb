# frozen_string_literal: true

module Authentication

  class SessionsController < Devise::SessionsController
    def create
      customer = Customer.find_by(email: customer[:email])
      if customer && customer.authenticate(customer[:password])
        log_in customer
        flash[:success] = 'You have successfully logged in!'
        redirect_to customer
      # else
        # flash.now[:delete] = 'Invalid email/password combination'
        # render 'new'
      end
    end
  end
end
