require 'rails_helper'

RSpec.describe 'Pins API', type: :request do
  let!(:user) { create(:user) }
  let!(:pin) { create_list(:pin, 20, user_id: user.id)}
  let(:id) { pin.first.id }

  describe 'GET /pins' do
    before { get '/pins' }

    it 'returns pins' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for DELETE /pins/:id
  describe 'DELETE /pins/:id' do
    before { delete "/pins/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
