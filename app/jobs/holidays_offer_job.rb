class HolidaysOfferJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @current_date = Holidaysoffer.where(: date == Date.today)
  end
end
