class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def index 
        redirect_to root_path
    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.save 
            session[:id] = @user.id
            if @user.role == 1
                render 'users/teachers/show'
            else 
                render 'users/donors/show'
            end 
        else 
            render 'new'
        end 
    end 

    def show 
        @user = User.find_by_id(params[:id])
        if @user != current_user
            redirect_to current_user
        else 
            if @user.role == 1 
                render 'users/teachers/show'
            else @user.role == 2
                render 'users/donors/show'
            end 
        end 
    end 

    def edit 
        @user = User.find_by_id(params[:id])
        if @user.role == 2
            render 'users/donors/edit'
        else 
            redirect_to current_user
        end 
    end 

    def update 
        @user = User.find_by_id(params[:id])
        @user.update(donation_params)
        redirect_to user_path(@user)
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password, :role)
    end 

    def donation_params
        params.require(:user).permit(:donation_amount)
    end 

    

end
