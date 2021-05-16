require 'rails_helper'

RSpec.describe API::V1::Computers::Show, type: :request do
  describe 'GET /api/v1/computers/:id' do
    subject { get "/api/v1/computers/#{id}" }

    let(:computer) { create(:computer) }

    context 'when computer exist' do
      let(:id) { computer.id }

      it 'returns 200 status' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'returns a computer' do
        subject
        expect(response.body).to eq(computer.to_json)
      end
    end

    context 'when computer does not exist' do
      let(:id) { SecureRandom.uuid }

      it 'returns 404 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(404)
      end
    end
  end
end
