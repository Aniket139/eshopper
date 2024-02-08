# frozen_string_literal: true

# :nodoc
class CelebrateDobJob
  include Sidekiq::Job
  queue_as :default

  def perform(_args)
    @customers = Customer.all
    @celebrates = @customers.select { |c| c.dob.month == Date.today.month && c.dob.day == Date.today.day }
    return unless @celebrates.any?

    @celebrates.each do |customer|
      CustomersMailer.dob_offer(customer).deliver_now
    end
  end
end
