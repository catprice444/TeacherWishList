class UsersController < ApplicationController
    
    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.save 
            session[:id] = @user.id
            redirect_to user_path(@user)
        else 
            render 'users/new'
        end 
    end 

    def show 
        @user = User.find_by_id(params[:id])
        if @user.role == 1 
            render 'users/teachers/show'
        else 
            render 'users/donors/show'
        end 
    end 

    def edit 
        @user = User.find_by_id(params[:id])
    end 

    def update 
        @user = User.find_by_id(params[:id])
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password, :role, )
    end 

    #should I create two different types of params, one for donor and one for teacher?

end
