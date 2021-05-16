module API
  module V1
    module Computers
      class Base < API::V1::Base
        resource :computers do
          mount Computers::Index
          mount Computers::Create

          route_param :id do
            mount Computers::Show
            mount Computers::Update
          end
        end
      end
    end
  end
end
