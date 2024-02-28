# frozen_string_literal: true

# :nodoc
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :customer_id
  end
end
