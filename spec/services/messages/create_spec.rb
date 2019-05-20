require 'rails_helper'

RSpec.describe Messages::Create do
  let(:valid_params) { build :message_params }
  let(:expected) {
    Dry::Monads::Success.new(
      {
        messages: [Message.last]
      }
    )
  }

  subject { described_class.new.call(valid_params) }

  it 'returns a Success object' do
    is_expected.to be_a(Dry::Monads::Success)
  end

  it 'returns an array of messages' do
    is_expected.to eq(expected)
  end
end
