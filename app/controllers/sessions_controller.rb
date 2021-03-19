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

    def github 
        raise inspect.params
        @user = User.find_or_create_by(email: auth["email"]) do |user|
            user.username = auth["first_name"]
            user.password = SecureRandom.hex(10)
          end
          if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            redirect_to '/'
          end
    end 
    
    private 
    def auth
        request.env['omniauth.auth']
    end

end
