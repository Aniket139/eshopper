require 'rails_helper'

RSpec.describe HolidaysJob, type: :job do
  describe "#perform" do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
    let(:customer1) { FactoryBot.create(:customer, country: country, state: state, city: city, business: business ) }
    let(:customer2) { FactoryBot.create(:customer, country: country, state: state, city: city, business: business ) }
    let(:holiday) { FactoryBot.create(:holiday) }

    it "sends offers to customers for today's holiday" do
      allow(Customer).to receive(:all).and_return([customer1, customer2])
      allow(::Holiday).to receive(:where).with(date: Date.today).and_return([holiday])
      expect(HolidaysMailer).to receive(:send_offers).with(customer1, holiday).once
      expect(HolidaysMailer).to receive(:send_offers).with(customer2, holiday).once

      HolidaysJob.new.perform
    end

    it "does not send offers if there are no holidays today" do
      allow(Customer).to receive(:all).and_return([customer1, customer2])
      allow(::Holiday).to receive(:where).with(date: Date.today).and_return([])
      expect(HolidaysMailer).not_to receive(:send_offers)

      HolidaysJob.new.perform
    end
  end
end
