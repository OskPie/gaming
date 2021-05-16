module API
  module V1
    class Base < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      mount Users::Base
      mount Computers::Base
      mount Games::Base
    end
  end
end
