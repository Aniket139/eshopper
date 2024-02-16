# frozen_string_literal: true

require 'rails_helper'

class DataHelperTest < ActionView::TestCase 
  RSpec.describe DataHelper, type: :helper do
    subject { FactoryBot.create(:country) }
    let(:state) { FactoryBot.create(:state, country: country) }
    let(:city) { FactoryBot.create(:city, state: state) }

    describe '#country_name' do
      it 'returns an array of country names and ids' do
        country1 = subject

        countries = helper.country_name
      end
    end

    describe '#state' do
      it 'returns an array of state names and ids' do
        state1 = state
    
        states = helper.state
      end
    end

    describe '#city' do
      it 'returns an array of city names and ids' do
        city1 = city
    
        states = helper.city
      end
    end
  end    
end
