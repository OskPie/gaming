# frozen_string_literal: true

module API
  module V1
    module Computers
      class Show < API::V1::Computers::Base
        desc 'Return a computer'

        params do 
          requires :id
        end

        get do
          computer = Computer.find(params[:id])
          render computer
        end
      end
    end
  end
end
