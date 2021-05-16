module API
  module ErrorHandlers
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        error!(
          code: 'record_not_found',
          message: 'Record not found',
          source: { parameter: e.id },
          status: 404
        )
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error!(
          code: 'invalid_record',
          message: e.message,
          source: { parameter: e },
          status: 422
        )
      end
    end
  end
end
