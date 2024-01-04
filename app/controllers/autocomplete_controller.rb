class AutocompleteController < ApplicationController
  def states
    @country = Country.find_by(id: params[:country_id])
    states = @country.states if @country.present?
    render json: states
  end

  def cities
    @state = State.find_by(id: params[:state_id])
    @cities = @state.cities
    render json: @cities
  end
end
