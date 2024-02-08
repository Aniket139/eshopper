# frozen_string_literal: true

# :nodoc
class CustomerController < ApplicationController
  def index; end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    if @customer.update(edit_customer_params)
      flash[:success] = 'Profile successfully updated'
      redirect_to @customer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def edit_customer_params
    params.require(:customer).permit(:first_name, :middle_name, :last_name, :email,
                                     :mobile, :street, :landmark, :pincode, :city_id, :state_id, :country_id, :dob)
  end
end
