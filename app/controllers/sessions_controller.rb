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
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.name = auth["info"]["first_name"]
            user.password = SecureRandom.hex(10)
        end
        if @user.persisted?
            session[:user_id] = @user.id
            flash[:msg] = "Logged in through google"
            redirect_to @user
        else
            flash[:msg] = "Not logged in"
            redirect_to @user
        end
    end 
    
    private 
    def auth
        request.env['omniauth.auth']
    end

end
