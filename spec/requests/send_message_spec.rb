require 'rails_helper'

RSpec.describe 'Send message', type: :request do
  context 'when valid params' do
    let(:params) { build :message_params }

    let(:expected_response) {
      {
        success: true,
        results: [{ user_id: '11', messenger: 'telegram', status: 'passed', error: nil }]
      }
    }

    it 'returns 200 code' do
      post '/send_message', params: { message: params }

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(expected_response.to_json)
      expect(response.content_type).to eq('application/json')
    end
  end

  context 'when invalid params' do
    let(:params) { build :invalid_message_params }
    let(:expected_response) { [:errors, { body: ['must be filled'] }] }

    it 'returns an array of errors' do
      post '/send_message', params: { message: params }

      expect(response).to have_http_status(:bad_request)
      expect(response.body).to eq(expected_response.to_s)
    end
  end
end
