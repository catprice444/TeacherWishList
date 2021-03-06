class UsersController < ApplicationController
    
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
        @user = User.find_by_id(params[:id])
        if @user.role == 1 
            render 'users/teachers/edit'
        else 
            render 'users/donors/edit'
        end 
    end 

    def update 
        @user = User.find_by_id(params[:id])
        redirect_to user_path(@user)
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password, :role, :donation_amount)
    end 

    #should I create two different types of params, one for donor and one for teacher?

end
