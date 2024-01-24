# frozen_string_literal: true

module DataHelper
  def country_name
    Country.pluck(:name, :id)
  end

  def state
    State.pluck(:name, :id)
  end

  def city
    City.pluck(:name, :id)
  end
end
