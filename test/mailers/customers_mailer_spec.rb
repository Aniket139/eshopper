# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersMailer, type: :mailer do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
  let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state, business: business ) }
  let(:token) { "123456" }
  let(:mail) { described_class.confirmation_instructions(customer, token) }

  describe "#confirmation_instructions" do
    it "has the correct recipient, subject, and token" do
      expect(mail.to).to eq([customer.email])
    #   expect(mail.subject).to eq("confirmation_instructions")
      expect(mail.body.encoded).to include(token)
    end
  end

  describe "#field_blank" do
    let(:mail) { described_class.field_blank(customer) }

    it "has the correct recipient and subject" do
      expect(mail.to).to eq([customer.email])
      expect(mail.subject).to eq("Please input blank field")
    end
  end

  describe "#dob_offer" do
    let(:mail) { described_class.dob_offer(customer) }

    it "has the correct recipient and subject" do
      expect(mail.to).to eq([customer.email])
      expect(mail.subject).to eq("Happy Birthday offer")
    end
  end
end
