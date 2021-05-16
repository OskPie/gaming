# frozen_string_literal: true

module API
  module V1
    module Games
      class Show < API::V1::Games::Base
        desc 'Return a game'

        params do 
          requires :id
        end

        get do
          game = Game.find(params[:id])
          render game
        end
      end
    end
  end
end
