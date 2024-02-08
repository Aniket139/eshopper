# frozen_string_literal: true

# :nodoc:
class CustomerRefreshCacheJob < ApplicationJob
  @queue = :default
  def perform(id)
    customer = Customer.find_by(id:)
    return if customer.blank?

    customer.generate_cache
  end
end
