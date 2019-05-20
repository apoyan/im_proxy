require 'rails_helper'

RSpec.describe Messages::Proxy do
  let(:valid_params) { build :message_params }

  subject { described_class.new.call(valid_params) }

  it 'returns a Success object' do
    is_expected.to be_a(Dry::Monads::Success)
  end
end
