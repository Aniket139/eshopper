class HolidaysOfferJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Holiday Offers"
  end
end
