# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FillCustomersAllDataJob, type: :job do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
  let(:customer) { FactoryBot.create(:customer, country: country, state: state, city: city, business: business ) }
  describe '#perform' do
    let(:args) { { 'id' => customer.id } }

    it 'sends an email with customer information' do
      expect { FillCustomersAllDataJob.new.perform(args) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
