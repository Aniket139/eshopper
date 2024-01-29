class FillCustomersAllDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @customer = Customer.find(args[:id])
    @customer.attributes.each do |key, value|
      if value.blank?
      end
    end
    FillCustomersAllDataMailer.field_blank.deliver_later
  end
end
