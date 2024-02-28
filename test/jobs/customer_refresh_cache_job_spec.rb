require 'rails_helper'

RSpec.describe CustomerRefreshCacheJob, type: :job do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
  let(:customer) { FactoryBot.create(:customer, city: city, country: country, state: state, business: business ) }
  let(:job) { described_class.perform_later(customer.id) }

  ActiveJob::Base.queue_adapter = :test

  describe '#perform' do
    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is in default queue' do
      expect(described_class.new.queue_name).to eq('default')
    end

    it 'executes perform' do
      perform_enqueued_jobs { job }
    end
  end
end
