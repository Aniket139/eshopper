require 'rails_helper'

RSpec.describe HolidaysMailer, type: :mailer do
  describe '#send_offers' do
    let(:country) { FactoryBot.create(:country) } 
    let(:state) { FactoryBot.create(:state, country: country) } 
    let(:city) { FactoryBot.create(:city, state: state) }
    let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
    let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state, business: business ) }
    let(:holiday) { FactoryBot.create(:holiday) }
    let(:mail) { HolidaysMailer.send_offers(customer, holiday).deliver_now }

    it 'renders the headers' do
      expect(mail.subject).to eq("Holidays offers #{holiday.name}")
      expect(mail.to).to eq([customer.email])
      expect(mail.from).to eq(['eshopper@gmail.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello #{customer.name}")
      expect(mail.body.encoded).to match("We have some great deals for #{holiday.name}")
    end
  end
end
