# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_business

  def set_business
    @business = Business.first
  end
end
