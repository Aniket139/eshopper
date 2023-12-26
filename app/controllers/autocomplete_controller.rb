class AutocompleteController < ApplicationController

  def country
    @country = Country.find(params[:id])
    states = State.where(country_id: @country)
    render json: states
  end

  def cities
    @state = State.find(params[:id])
    @cities = @state.cities
    render json: @cities
  end
end
