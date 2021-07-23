module Auth
  class SessionsController < ApplicationController
    def create
      login = SessionsService.new(params[:email], params[:password])

      return not_login unless login.status == 200

      session[:user_id] = login.response['data']['id']
      redirect_to admin_users_path
    end

    private

    def not_login
      flash[:error] = 'These credentials are incorrect'
      redirect_to auth_login_form_path
    end

  end
end
