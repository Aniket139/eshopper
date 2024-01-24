# frozen_string_literal: true

class CustomersMailer < Devise::Mailer
  default from: 'eshopper@gmail.com'

  def confirmation_instructions(record, token, _opts = {})
    @token = token
    @resource = record
    mail(to: record.email, subject: 'Confirmation instructions')
  end
end
