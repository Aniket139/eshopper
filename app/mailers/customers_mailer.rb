class CustomersMailer < Devise::Mailer
  default from: 'eshopper@gmail.com'
  
  def confirmation_instructions(record, token, opts = {})
    @token = token
    @resource = record
    mail(to: record.email, subject: 'Confirmation instructions')
  end
end
  
