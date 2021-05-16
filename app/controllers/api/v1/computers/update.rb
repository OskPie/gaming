# frozen_string_literal: true

module API
  module V1
    module Computers
      class Update < API::V1::Computers::Base
        desc 'Update a computer'

        params do
          optional :name, type: String, desc: 'Name'
        end

        patch do
          computer = Computer.find(params[:id])
          computer.update!(declared(params))
        end
      end
    end
  end
end
