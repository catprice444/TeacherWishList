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
       binding.pry
    end 
    
    private 
    def auth
        request.env['omniauth.auth']
    end

end
