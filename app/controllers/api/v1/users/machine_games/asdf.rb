# frozen_string_literal: true

module API
  module V1
    module Users
      module MachineGames
        class Asdf < API::V1::Users::MachineGames::Base
          desc 'Search your machine games'

          params do
            requires :q, type: String, desc: 'Query'
          end

          get do
            user = User.find(params[:id])
            render user.machine_games
          end
        end
      end
    end
  end
end
