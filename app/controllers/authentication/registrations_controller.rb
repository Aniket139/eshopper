module Authentication

  class RegistrationsController < Devise::RegistrationsController

    def index
    end

    def create
      @customer = Customer.create(sign_up_params)
      if @customer.persisted?
        flash[:success] = 'Signup successful!'
        CustomersMailer.confirmation_instructions(@customer, @customer.confirmation_token).deliver_now
        redirect_to root_path
      else
        render :new
      end
    end
  
    private
  
    def sign_up_params
      params.require(:customer).permit(:email, :password, :password_confirmation, :country_id, :state_id, :city_id, :business_id)
    end  

    protected

    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end
  end
 end
