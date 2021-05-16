# frozen_string_literal: true

module API
  module V1
    module Users
      class Create < API::V1::Users::Base
        desc 'Create an user'
        params do
          requires :email, type: String, desc: 'Email address'
          optional :first_name, type: String, desc: 'First name'
          optional :last_name, type: String, desc: 'Last name'
        end

        post do
          user = User.create!(declared(params))
        end
      end
    end
  end
end
