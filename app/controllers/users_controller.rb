class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.save 
            session[:id] = @user.id
            render 'users/role'
        else 
            render :new
        end 
    end 

    def show 
        @user = User.find_by_id(params[:id])
        if @user.role == 1
            render 'users/teachers/show'
        elsif @user.role == 2 
            render 'users/donors/show'
        else 
             render 'users/role'
        end
        redirect_to '/' if !@user 
    end 

    def edit 
        @user = User.find_by_id(params[:id])
        if @user.role == 2
            render 'users/donors/edit'
        elsif @user.role == nil
            render 'users/role'
        else 
            redirect_to user_path(@user)
        end 
    end 

    def update 
        @user = User.find_by_id(params[:id])
        if @user.role == nil 
            @user.update(role_params)
        else 
            @user.update(donation_params)
        end 
        redirect_to user_path(@user)
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password, :email)
    end 

    def donation_params
        params.require(:user).permit(:donation_amount)
    end 

    def role_params
        params.require(:user).permit(:role)
    end
end
