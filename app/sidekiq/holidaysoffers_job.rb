# frozen_string_literal: true

# :nodoc
class HolidaysoffersJob
  include Sidekiq::Job
  queue_as :default

  def perform(*_args)
    @customer = Customer.all
    HolidaysoffersMailer.holidays_offers(@customer).deliver_now
  end
end
