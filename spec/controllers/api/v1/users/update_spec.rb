require 'rails_helper'

RSpec.describe API::V1::Users::Update, type: :request do
  describe 'PATCH /api/v1/users' do
    subject { patch "/api/v1/users/#{id}/", params: { email: email } }

    let(:user) { create(:user) }

    context 'when email is valid and updates the user' do
      let(:email) { 'valid@email.com' }
      let(:id) { user.id }

      it 'returns 200 status' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'updates user' do
        subject
        expect(response.body).to eq('true')
      end
    end

    context 'when email is invalid and does not update the user' do
      let(:email) { 'invalid_email' }
      let(:id) { user.id }

      it 'returns 422 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(422)
      end

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message']).to eq('Validation failed: Email is invalid')
      end
    end

    context 'when email is empty and does not update the user' do
      let(:email) { nil }
      let(:id) { user.id }

      it 'returns 422 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(422)
      end

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message']).to eq("Validation failed: Email can't be blank, Email is invalid")
      end
    end
  end
end
