module Authentication

  class RegistrationsController < Devise::RegistrationsController

    def index
    end

    def create
      @customer = Customer.create(sign_up_params)
      if @customer.persisted?
        flash[:success] = 'Signup successful!'
        redirect_to root_path
      else
        render :new
      end
    end
  
    private
  
    def sign_up_params
      params.require(:customer).permit(:email, :password, :password_confirmation, :country_id, :state_id, :city_id, :business_id)
    end  
  end
 end
