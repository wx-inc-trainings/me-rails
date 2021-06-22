class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate

  protect_from_forgery with: :null_session

  rescue_from ActionController::UnpermittedParameters, with: :unpermitted_parameters
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_invalid(error)
    render json: { error: error.record.errors }, status: :unprocessable_entity
  end

  def record_not_found(error)
    render json: { error: error.to_s }, status: :not_found
  end

  def unpermitted_parameters(error)
    render json: { error: error.to_s }, status: :bad_request
  end

end
