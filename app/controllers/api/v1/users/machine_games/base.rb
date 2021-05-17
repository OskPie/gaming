module API
  module V1
    module Users
      module MachineGames
        class Base < API::V1::Base
          resource :machine_games do
            mount MachineGames::Install
            mount MachineGames::Library
          end
        end
      end
    end
  end
end
