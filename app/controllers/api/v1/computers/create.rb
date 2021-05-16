# frozen_string_literal: true

module API
  module V1
    module Computers
      class Create < API::V1::Computers::Base
        desc 'Create a computer'

        params do
          requires :name, type: String, desc: 'Name'
        end

        post do
          computer = Computer.create!(declared(params))
        end
      end
    end
  end
end
