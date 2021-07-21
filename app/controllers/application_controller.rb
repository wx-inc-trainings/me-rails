class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ErrorsHandler
  include LocalesI18n
  include Pundit
  include Wor::Paginate

  protect_from_forgery with: :null_session

end
