require 'rails_helper'

RSpec.describe Messages::Send do
  let(:messages) { create_list :message, 3 }
  let(:expected) { Dry::Monads::Success.new(messages.map { |m| MessageEntity.build(m) }) }

  subject { described_class.new.call(messages: messages) }

  it 'returns a Success object' do
    is_expected.to be_a(Dry::Monads::Success)
  end

  it 'returns an array of messages' do
    is_expected.to eq(expected)
  end
end
