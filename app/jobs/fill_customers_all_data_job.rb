class FillCustomersAllDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @customer = Customer.find(args[:id])
    @avoid_fields = %w[password conform_password created_at updated_at encrypted_password
                    reset_password_token reset_password_sent_at confirmation_token confirmed_at 
                    confirmation_sent_at unconfirmed_email remember_created_at]
    @fields = @customer.attributes.keys - @avoid_fields
  end
end

