# frozen_string_literal: true

module API
  module V1
    module Computers
      class Index < API::V1::Computers::Base
        desc 'Return a list of all Computers'

        get do
          computer = Computer.all
          render computer
        end
      end
    end
  end
end
