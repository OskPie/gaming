# frozen_string_literal: true

module API
  module V1
    module Users
      module MachineGames
        class Search < API::V1::Users::MachineGames::Base
          desc 'Search'

          params do
            requires :query, type: String, desc: 'Query'
          end

          get do
            user = User.find(params[:id])
            # sql here or call to query object
          end
        end
      end
    end
  end
end
