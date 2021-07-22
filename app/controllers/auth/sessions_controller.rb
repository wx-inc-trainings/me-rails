class Auth::SessionsController < ApplicationController
    def create
        login = SessionsService.new(params[:email], params[:password])

        if login.status_code != 200
            flash[:error] = "These credentials are incorrect"
            return redirect_to auth_login_form_path
        end

        session[:user_id] = login.response["data"]["id"]
        redirect_to admin_users_path
    end
end
