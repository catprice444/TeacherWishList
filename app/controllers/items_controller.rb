class ItemsController < ApplicationController
    

    def new
        @item = Item.new
        @schools = School.all
    end 

    def create
        @item = Item.create(item_params)
        if @item.save 
            redirect_to school_path(@school)
        else 
            redirect_to schools_path
        end 
    end 

    def show 
        @item = Item.find_by_id(params[:id])
    end 

    def edit 
        @item = Item.find_by_id(params[:id])
        @schools = School.all
        if current_user.id == @item.user_id
            render 'items/teachers/edit'
        else 
            redirect_to schools_path
        end 
    end 
    
    def update 
        @item = Item.find_by_id(params[:id])
        if @item = Item.update(item_params)
            redirect_to item_path(@item)
        else 
            redirect_to schools_path
        end 
    end 

    def donate
        @item = Item.find_by_id(params[:id])
        render 'items/donors/donate'
    end 

    def donated 
        @item = Item.update(donation_params)
        donation = @item.donation
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
        params.require(:item).permit(:cost, :name, :amount_needed, :school_id, :user_id)
    end 

    def donation_params
        params.require(:item).permit(:amount_needed)
    end 

     
end
