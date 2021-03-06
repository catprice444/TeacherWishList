class SessionsController < ApplicationController
    skip_before_action :require_login

    def new
        @users = User.all
    end
    
    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end
    
    def destroy
        if session[:user_id]
          session.delete :user_id
        end
        redirect_to root_path
    end

end
