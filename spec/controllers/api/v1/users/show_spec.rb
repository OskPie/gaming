require 'rails_helper'

RSpec.describe API::V1::Users::Show, type: :request do
  describe 'GET /api/v1/users/:id' do
    subject { get "/api/v1/users/#{id}" }

    let(:user) { create(:user) }

    context 'when user exist' do
      let(:id) { user.id }

      it 'returns 200 status' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'returns an user' do
        subject
        expect(response.body).to eq(user.to_json)
      end
    end

    context 'when user does not exist' do
      let(:id) { SecureRandom.uuid }

      it 'returns 404 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(404)
      end
    end
  end
end
