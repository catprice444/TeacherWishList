class ItemsController < ApplicationController
    
    def index
        @items = Items.all
    end 

    def new
        @item = Item.new 
    end 

    def create
        @item = Item.create(item_params)
    end 

    def show 
        @item = Item.find(params[:id])
    end 

    def edit 
        @item = Item.find(params[:id])
    end 
    
    def update 
        @item = Item.find(params[:id])
    end 

    private 
    def item_params
        params.require(:item).permit(:cost, :name, :amount_needed)
    end 
end
