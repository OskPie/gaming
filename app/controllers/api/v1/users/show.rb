# frozen_string_literal: true

module API
  module V1
    module Users
      class Show < API::V1::Users::Base
        desc 'Return an User'

        params do 
          requires :id
        end

        get do
          user = User.find(params[:id])
          render user
        end
      end
    end
  end
end
