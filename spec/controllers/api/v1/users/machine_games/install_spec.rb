require 'rails_helper'

RSpec.describe API::V1::Users::MachineGames::Install, type: :request do
  describe 'POST /api/v1/users/:id/machine_games' do
    subject { post "/api/v1/users/#{id}/machine_games", params: params }
    let(:params) do
      {
        user: user,
        game_id: game.id,
        computer_id: computer.id
      }
    end

    context 'when params are valid install the game on the machine' do
      let(:user) { create(:user) }
      let(:game) { create(:game, user: user) }
      let(:computer) { create(:computer, user: user) }
      let(:id) { user.id }

      it 'returns 201 status' do
        subject
        expect(response).to have_http_status(201)
      end

      it 'installing game on the computer' do
        subject
        expect(JSON.parse(response.body)['game_id']).to eq(game.id)
        expect(JSON.parse(response.body)['computer_id']).to eq(computer.id)
      end
    end

    context 'when params are invalid and does not install game on the computer' do
      let(:user) { create(:user) }
      let(:game) { create(:game) }
      let(:computer) { create(:computer) }
      let(:id) { user.id }

      it 'returns 404 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(404)
      end

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message']).to eq('Record not found')
      end
    end

    context 'when user want install game which is already installed on the computer' do
      let(:user) { create(:user) }
      let(:game) { create(:game, user: user) }
      let(:computer) { create(:computer, user: user) }
      let(:id) { user.id }

      before { create(:machine_game, user: user, game: game, computer: computer) }

      it 'returns 422 status' do
        subject
        expect(JSON.parse(response.body)['status']).to eq(422)
      end

      it 'returns validation message' do
        subject
        expect(JSON.parse(response.body)['message']).to eq('Validation failed: Computer already had this game installed')
      end
    end
  end
end
