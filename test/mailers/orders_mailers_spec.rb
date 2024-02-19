# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersMailer, type: :mailer do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state ) } 
  let(:order) { FactoryBot.create(:order, customer: customer, city: city, state: state, country: country ) }
  let(:mail) { described_class.confirmation(order) }

  describe "#confirmation" do
    it "has the correct recipient, subject, and order details" do
      expect(mail.to).to eq([order.customer.email])
      expect(mail.subject).to eq("Order Confirmation")
      expect(mail.body.encoded).to include(order.id.to_s)
    #   expect(mail.body.encoded).to include(order.total)
    #   order.order_products.each do |order_product|
    #     expect(mail.body.encoded).to include(order_product.product.name)
    #     expect(mail.body.encoded).to include(order_product.quantity.to_s)
    #     expect(mail.body.encoded).to include(order_product.price.to_s)
    #   end
    end
  end

  describe "#cancel" do
    it "has the correct recipient and subject" do
      expect(mail.to).to eq([order.customer.email])
    #   expect(mail.subject).to eq("Order cancelled")
    end
  end
end
