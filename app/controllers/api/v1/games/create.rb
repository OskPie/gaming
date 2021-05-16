# frozen_string_literal: true

module API
  module V1
    module Games
      class Create < API::V1::Games::Base
        desc 'Create a game'

        params do
          requires :title, type: String, desc: 'Title'
          optional :game_progress
        end

        post do
          game = Game.create!(declared(params))
        end
      end
    end
  end
end
