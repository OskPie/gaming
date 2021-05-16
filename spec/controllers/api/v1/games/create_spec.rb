require 'rails_helper'

RSpec.describe API::V1::Games::Create, type: :request do
  describe 'POST /api/v1/games' do
    subject { post "/api/v1/games", params: { title: title, game_progress: 10 } }

    context 'when title is valid and creates game' do
      let(:title) { 'valid' }

      it 'returns 201 status' do
        subject
        expect(response).to have_http_status(201)
      end

      it 'creates game with valid title' do
        subject
        expect(JSON.parse(response.body)['title']).to eq(title)
      end
    end

    context 'when params are invalid and does not create game' do
      let(:title) { nil }

      it 'returns 422 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(422)
      end

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message'])
          .to eq("Validation failed: Title can't be blank")
      end
    end
  end
end
