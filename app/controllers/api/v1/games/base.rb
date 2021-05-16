module API
  module V1
    module Games
      class Base < API::V1::Base
        resource :games do
          mount Games::Index
          mount Games::Create

          route_param :id do
            mount Games::Show
            mount Games::Update
          end
        end
      end
    end
  end
end
