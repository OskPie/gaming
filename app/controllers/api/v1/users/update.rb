# frozen_string_literal: true

module API
  module V1
    module Users
      class Update < API::V1::Users::Base
        desc 'Update an user'
        params do
          optional :email, type: String, desc: 'Email address'
          optional :first_name, type: String, desc: 'First name'
          optional :last_name, type: String, desc: 'Last name'
        end

        patch do
          user = User.find(params[:id])
          user.update!(declared(params))
        end
      end
    end
  end
end
