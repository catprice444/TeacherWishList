class UsersController < ApplicationController
    
    skip_before_action :require_login, only: [:new, :create]

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.save 
            session[:id] = @user.id
            if @user.role == 1
                render 'schools/new'
            else 
                render 'users/donors/show'
            end 
        else 
            render 'users/new'
        end 
    end 

    def show 
        @user = User.find_by_id(params[:id])
        if @user.role == 1 
            render 'users/teachers/show'
        else @user.role == 2
            render 'users/donors/show'
        end 
    end 

    def edit 
        @user = current_user
        if @user.role == 1 
            render 'users/teachers/edit'
        else 
            render 'users/donors/edit'
        end 
    end 

    def update 
        if current_user.update donation_params
            redirect_to current_user
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password, :role)
    end 

    def donation_params
        params.require(:user).permit(:donation_amount)
    end 

    

end
