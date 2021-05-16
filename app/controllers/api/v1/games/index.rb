# frozen_string_literal: true

module API
  module V1
    module Games
      class Index < API::V1::Games::Base
        desc 'Return a list of all games'

        get do
          games = Game.all
          render games
        end
      end
    end
  end
end
