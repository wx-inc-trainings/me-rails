class ApplicationController < ActionController::Base
  include Wor::Paginate
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protect_from_forgery with: :null_session

  def record_not_found(error)
    render json: { error: error.to_s }, status: :not_found
  end

end
