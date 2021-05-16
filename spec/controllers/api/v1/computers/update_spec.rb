require 'rails_helper'

RSpec.describe API::V1::Computers::Update, type: :request do
  describe 'PATCH /api/v1/computers' do
    subject { patch "/api/v1/computers/#{id}/", params: { name: name } }

    let(:computer) { create(:computer) }

    context 'when computer is valid and update the computer' do
      let(:name) { 'valid' }
      let(:id) { computer.id }

      it 'returns 200 status' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'updates computer' do
        subject
        expect(response.body).to eq('true')
      end
    end

    context 'when name is empty and does update computer' do
      let(:name) { nil }
      let(:id) { computer.id }

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
