class ItemsController < ApplicationController
    def index 
        @items = Item.all 
    end 

    def new
        @item = Item.new
        @schools = School.all
    end 

    def create
        @item = Item.create(items_params)
        if @item.save 
            redirect_to school_path(@item.school_id)
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
        if @item.update(item_params)
            redirect_to item_path
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
        current_user.update(donation_amount: (current_user.donation_amount.to_i - @item.total_cost.to_i))
        @item.update_column(:amount_needed, 0)
        flash[:message] = "Thanks for your donation"
        redirect_to item_path 
    end

    def destroy 
        @item = Item.find_by_id(params[:id])
        if @item.user_id = current_user.id
            @item.delete 
        else 
            redirect_to item_path
            flash[:message] = "Sorry you cannot delete this item"
        end 
        redirect_to schools_path
    end 
   

    private 
    def items_params
        params.require(:item).permit(:cost, :name, :amount_needed, :school_id, :user_id)
    end 

    def item_params
        params.require(:item).permit(:cost, :amount_needed)
    end
end
