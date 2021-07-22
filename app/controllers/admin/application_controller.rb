# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      redirect_to auth_login_form_path unless !!current_user
      if current_user.role != "admin"
        render 'error/page_401'
      end
      current_user.role == "admin"
    end

    protected
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
