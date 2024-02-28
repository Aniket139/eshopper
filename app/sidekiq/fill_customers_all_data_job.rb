# frozen_string_literal: true

# :nodoc
class FillCustomersAllDataJob
  include Sidekiq::Job
  queue_as :default

  def perform(args)
    @customer = Customer.find(args['id'])
    CustomersMailer.field_blank(@customer).deliver_now
  end
end
