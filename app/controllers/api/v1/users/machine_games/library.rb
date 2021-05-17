# frozen_string_literal: true

module API
  module V1
    module Users
      module MachineGames
        class Library < API::V1::Users::MachineGames::Base
          mount MachineGames::Search

          desc 'Return a list of all Machine Games'

          get do
            user = User.find(params[:id])
            render user.machine_games
          end
        end
      end
    end
  end
end
