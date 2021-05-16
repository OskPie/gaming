# frozen_string_literal: true

module API
  module V1
    module Games
      class Update < API::V1::Games::Base
        desc 'Update a game'

        params do
          optional :title, type: String, desc: 'Title'
          optional :game_progress
        end

        patch do
          game = Game.find(params[:id])
          game.update!(declared(params))
        end
      end
    end
  end
end
