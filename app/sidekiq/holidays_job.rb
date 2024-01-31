# frozen_string_literal: true

# :nodoc
class HolidaysJob
  include Sidekiq::Job
  queue_as :default

  def perform(*_args)
    @customers = Customer.all
    @holidays = ::Holiday.where(Date.today == :date)
    return unless @holidays.any?

    @holidays.each do |holiday|
      @customers.each do |customer|
        HolidaysMailer.send_offers(customer, holiday).deliver_now
      end
    end
  end
end
