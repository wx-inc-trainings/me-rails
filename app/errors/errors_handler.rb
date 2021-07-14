module ErrorsHandler
    def self.included(clazz)
        clazz.class_eval do
          rescue_from ActionController::UnpermittedParameters, with: :unpermitted_parameters
          rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
          rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
          rescue_from Pundit::NotAuthorizedError, with: :not_authorized
        end
    end
  
      private
      def record_not_found(error)
        render json: { error: t('errors.not_found') }, status: :not_found
      end

      def record_invalid(error)
        render json: { error: error.record.errors }, status: :unprocessable_entity
      end

      def unpermitted_parameters(error)
        render json: { error: t('errors.unpermitted_parameters', params: error.params.join(",")) }, status: :bad_request
      end

      def not_authorized
        render json: { error: t('errors.not_authorize') }, status: :unauthorized
      end
  
end