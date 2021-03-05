class ItemsController < ApplicationController
    

    def new
        @item = Item.includes(:schools).new
        @schools = School.all
    end 

    def create
        @item = Item.create(item_params)
        @school = School.all
        
        if @item.save 
            redirect_to schools_path(@school)
        else 
            raise.inspect params
            redirect_to new_item_path
        end 

    end 

    def show 
        @item = Item.find_by_id(params[:id])
    end 

    def edit 
        @item = Item.find_by_id(params[:id])
    end 
    
    def update 
        @item = Item.find_by_id(params[:id])
    end 

    private 
    def item_params
        params.permit(:cost, :name, :amount_needed, :school_id).merge(user: current_user)
    end 

     
end
