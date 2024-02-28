require 'rails_helper'

RSpec.describe CelebrateDobJob, type: :job do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
  let(:customer) { FactoryBot.create(:customer, country: country, state: state, city: city, business: business ) }
  it 'sends dob offer email to customers celebrating their birthday' do
    # customer1 = Customer.create(name: 'Alice', dob: Date.today)
    # customer2 = Customer.create(name: 'Bob', dob: Date.today - 1.day)

    expect {
      CelebrateDobJob.perform_now
    }.to change { ActionMailer::Base.deliveries.size }.by(1)

    email = ActionMailer::Base.deliveries.last
    expect(email.to).to include(customer.email)
    expect(email.body).to include('Happy Birthday!')

    expect(ActionMailer::Base.deliveries.size).to eq(1)
  end
end
