# frozen_string_literal: true

# :nodoc:
class BusinessRefreshCacheJob < ApplicationJob
  @queue = :default
  def perform
    business = Business.first
    return if business.blank?

    business.generate_cache
  end
end