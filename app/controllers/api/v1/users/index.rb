# frozen_string_literal: true

module API
  module V1
    module Users
      class Index < API::V1::Users::Base
        desc 'Return a list of all Users'

        get do
          users = User.all.decorate
          render users
        end
      end
    end
  end
end
