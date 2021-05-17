# frozen_string_literal: true

module API
  module V1
    module Users
      module MachineGames
        class Install < API::V1::Users::MachineGames::Base
          desc 'Install game on a machine'

          params do
            requires :game_id, type: Integer, desc: 'Game'
            requires :computer_id, type: Integer, desc: 'Computer'
          end

          post do
            user = User.find(params[:id])
            game = user.games.find(params[:game_id])
            computer = user.computers.find(params[:computer_id])

            user.machine_games.create!(game: game, computer: computer)
          end
        end
      end
    end
  end
end
