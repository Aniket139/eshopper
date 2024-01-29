# frozen_string_literal: true

# :nodoc
class FillCustomersAllDataMailer < Devise::Mailer
  default from: 'eshopper@gmail.com'
  
  def field_blank(customer)
    @customer = customer
    mail(to: @customer.email, subject: 'Please input blank field')
  end
end
  