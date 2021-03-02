class UsersController < ApplicationController
    
    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    def update 
        @user = User.find(params[:id])
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password, :role, :donation_amount)
    end 

    #should I create two different types of params, one for donor and one for teacher?

end
