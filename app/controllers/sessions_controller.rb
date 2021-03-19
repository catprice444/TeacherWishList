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
        session.clear
        redirect_to root_path
        flash[:msg] = "You have logged out"
    end

    def google
        @user = User.from_omniauth(auth)
        if @user.save
            session[:user_id] = @user.id
            flash[:msg] = "Logged in through google"
            redirect_to user_path(@user)
        else
            flash[:msg] = "Not logged in"
            redirect_to '/'
        end
    end 
    
    private 
    def auth
        request.env['omniauth.auth']
    end

end
