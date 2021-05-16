# frozen_string_literal: true

module API
  module V1
    module Computers
      class Index < API::V1::Computers::Base
        desc 'Return a list of all Computers'

        get do
          computers = Computer.all
          render computers
        end
      end
    end
  end
end
