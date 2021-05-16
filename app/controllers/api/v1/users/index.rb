# frozen_string_literal: true

module API
  module V1
    module Users
      class Index < API::V1::Users::Base
        desc 'Return an list of all Users'

        get do
          user = User.all
          render user
        end
      end
    end
  end
end
