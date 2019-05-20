require 'rails_helper'

RSpec.describe MessageEntity do
  let(:expected) { { user_id: "1", messenger: 'viber', error: nil, status: "passed" } }
  let(:message) { create :message, user_id: "1" }

  subject { described_class.build(message) }

  describe '.build' do
    it 'returns a message entity' do
      is_expected.to include(expected)
    end
  end
end
