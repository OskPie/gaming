require 'rails_helper'

RSpec.describe API::V1::Users::Create, type: :request do
  describe 'POST /api/v1/users' do
    subject { post "/api/v1/users", params: { email: email } }
                  
    context 'when email is valid and creates an user' do
      let(:email) { 'valid@email.com' }

      it 'returns 201 status' do
        subject
        expect(response).to have_http_status(201)
      end

      it 'creates user with proper email' do
        subject
        expect(JSON.parse(response.body)['email']).to eq(email)
      end
    end

    context 'when email is invalid and does not create an user' do
      let(:email) { 'invalid_email' }

      it 'returns 422 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(422)
      end 

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message']).to eq('Validation failed: Email is invalid')
      end
    end

    context 'when email is empty and does not create an user' do
      let(:email) { nil }

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
