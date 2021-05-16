require 'rails_helper'

RSpec.describe API::V1::Games::Show, type: :request do
  describe 'GET /api/v1/games/:id' do
    subject { get "/api/v1/games/#{id}" }

    let(:game) { create(:game) }

    context 'when game exist' do
      let(:id) { game.id }

      it 'returns 200 status' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'returns a game' do
        subject
        expect(response.body).to eq(game.to_json)
      end
    end

    context 'when game does not exist' do
      let(:id) { SecureRandom.uuid }

      it 'returns 404 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(404)
      end
    end
  end
end
