# frozen_string_literal: true

# :nodoc
class HolidaysoffersMailer < ApplicationMailer
  default from: 'eshopper@gmail.com'

  def holidays_offers(customer)
    @customer = customer
    @current_date = Holidaysoffer.where(Date.today == :date)
    mail(to: @customer.email, subject: 'Holidays offers')
  end
end
