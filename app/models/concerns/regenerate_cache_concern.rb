# frozen_string_literal: true

# :nodoc:
module RegenerateCacheConcern
  extend ActiveSupport::Concern

  included do
    after_commit :regenerate_cache
    after_destroy :regenerate_cache
  end

  def regenerate_cache
    customer.create_refresh_cache_job
  end
end
