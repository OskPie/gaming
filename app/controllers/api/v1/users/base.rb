module API
  module V1
    module Users
      class Base < API::V1::Base
        resource :users do
          mount Users::Index
          mount Users::Create

          route_param :id do
            mount Users::Show
            mount Users::Update
          end
        end
      end
    end
  end
end
