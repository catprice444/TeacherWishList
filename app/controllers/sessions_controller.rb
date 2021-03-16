class SessionsController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def destroy
        if session[:user_id]
          session.delete :user_id
        end
        redirect_to root_path
        flash[:msg] = "You have logged out"
    end

end
