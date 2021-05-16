require 'rails_helper'

RSpec.describe API::V1::Computers::Create, type: :request do
  describe 'POST /api/v1/computers' do
    subject { post "/api/v1/computers", params: { name: name, game_progress: game_progress } }

    context 'when name is valid and creates computer' do
      let(:name) { 'valid' }
      let(:game_progress) { 10.00 }

      it 'returns 201 status' do
        subject
        expect(response).to have_http_status(201)
      end

      it 'creates computer with valid name' do
        subject
        expect(JSON.parse(response.body)['name']).to eq(name)
      end
    end

    context 'when name is empty and does not create computer' do
      let(:name) { nil }
      let(:game_progress) { nil }

      it 'returns 422 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(422)
      end

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message']).to eq("Validation failed: Name can't be blank")
      end
    end
  end
end
