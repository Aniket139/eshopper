# frozen_string_literal: true

# :nodoc
class CustomersMailer < Devise::Mailer
  default from: 'eshopper@gmail.com'

  def confirmation_instructions(record, token, _opts = {})
    @token = token
    @resource = record
    mail(to: record.email, subject: 'Confirmation instructions')
  end

  def field_blank(customer)
    @customer = customer
    @avoid_fields = %w[password conform_password created_at updated_at encrypted_password
                       reset_password_token reset_password_sent_at confirmation_token confirmed_at
                       confirmation_sent_at unconfirmed_email remember_created_at]
    mail(to: @customer.email, subject: 'Please input blank field')
  end
end
