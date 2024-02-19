# frozen_string_literal: true

# :nodoc
class ApplicationController < ActionController::Base
  before_action :set_business
  before_action :set_locale

  def set_business
    # reset_session
    @business = Business.first if session[:business_address].blank?
    if @business.present?
      session[:business_address] = @business.address
    end
    if cookies[:business].blank?
      cookies[:business] = { value: "address", expires: 1.minutes.from_now }
    end 
  end
  
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end