require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe MessageSenderWorker, :type => :worker do
  it { is_expected.to be_retryable 5 }
  # it { is_expected.to be_unique }

  # context 'scheduled' do
  #   let(:message_id) { 1 }
  #
  #   it 'enqueued a job' do
  #     time = 5.minutes.from_now.to_f
  #     described_class.perform_at time, message_id, true
  #
  #     expect(described_class).to have_enqueued_sidekiq_job([message_id, true]).at(time)
  #   end
  # end
end
