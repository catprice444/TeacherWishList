class ItemsController < ApplicationController
    

    def new
        @item = Item.new
        @schools = School.all
        
    end 

    def create
        
        @item = Item.create(item_params)
        
        @item.save 
        
        redirect_to schools_path(@school)
        
           
        
    end 

    def show 
        @item = Item.find_by_id(params[:id])
        
    end 

    def edit 
        @item = Item.find_by_id(params[:id])
        @schools = School.all
        render 'items/teachers/edit'
    end 
    
    def update 
        @item = Item.find_by_id(params[:id])
        if current_user.id == @item.user_id
            @item = Item.update(item_params)
            redirect_to school_item_path(@item)
        else 
            redirect_to schools_path
        end 
    end 

    def donate
        @item = Item.find_by_id(params[:id])
        render 'items/donors/donate'
    end 

    def donated 
        @item = Item.find_by_id(params[:id])
        donation = @item.enough_money?
        if donation == true 
            @item.save
            flash[:message] = "Thanks for the donation!"
            redirect_to schools_path 
        else  
            flash[:error] = "Not enough money"
            redirect_to item_path(@item)
        end 
    end 

    private 
    def item_params
        params.permit(:cost, :name, :amount_needed, :school_id, :user_id)
    end 

     
end
