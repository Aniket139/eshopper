# frozen_string_literal: true

# :nodoc
class City < ApplicationRecord
  belongs_to :state
end
