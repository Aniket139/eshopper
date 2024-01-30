# frozen_string_literal: true

# :nodoc
class HolidaysOfferJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @customer = Customer.find(args[:id])
    @current_date = Holidaysoffer.where(:date == Date.today)
  end
end
