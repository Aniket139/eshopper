# frozen_string_literal: true

# :nodoc
class HolidaysMailer < ApplicationMailer
  default from: 'eshopper@gmail.com'

  def send_offers(customer, holiday)
    @customer = customer
    @holiday = holiday
    mail(to: @customer.email, subject: "Holidays offers #{@holiday.name}")
  end
end
