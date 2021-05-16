require 'rails_helper'

RSpec.describe API::V1::Games::Update, type: :request do
  describe 'PATCH /api/v1/games' do
    subject { patch "/api/v1/games/#{id}/", params: { title: title, game_progress: game_progress} }

    let(:game) { create(:game) }

    context 'when title is valid and update the game' do
      let(:title) { 'valid' }
      let(:game_progress) { 20.00 }
      let(:id) { game.id }

      it 'returns 200 status' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'updates game' do
        subject
        expect(response.body).to eq('true')
      end
    end

    context 'when title is empty and does update game' do
      let(:title) { nil }
      let(:game_progress) { nil }
      let(:id) { game.id }

      it 'returns 422 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(422)
      end

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message'])
          .to eq("Validation failed: Title can't be blank, Game progress is not a number")
      end
    end
  end
end
