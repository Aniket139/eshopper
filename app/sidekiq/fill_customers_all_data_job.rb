# frozen_string_literal: true

# :nodoc
class FillCustomersAllDataJob
  include Sidekiq::Job
  queue_as :default

  def perform(args)
    puts "------------------------ args #{args}"
    @customer = Customer.find(args['id'])
    puts "------------------------ @customer #{@customer.inspect}"
    CustomersMailer.field_blank(@customer).deliver_now
  end
end
