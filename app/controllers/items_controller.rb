class ItemsController < ApplicationController
    

    def new
        @item = Item.new 
    end 

    def create
        @item = Item.create(item_params)
        @item.save 
        
        redirect_to school_items_path(@school)

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
        params.permit(:cost, :name, :amount_needed, :school_id, :user_id)
    end 
end
