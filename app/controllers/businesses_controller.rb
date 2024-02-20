class BusinessesController < ApplicationController
  def update_language
    @business = Business.first
    @business.update(language: params[:language])
    
    respond_to do |format|
      format.js { render inline: 'window.location.reload();' }
    end
   end
end
