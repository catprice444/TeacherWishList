class ItemsController < ApplicationController
    before_action :find_item_id, only: [:show, :edit, :update, :donate, :donated]
    before_action :redirect_if_not_owner, only: [:edit, :update]

    def index 
        if params[:school_id] && @school = School.find_by_id(params[:school_id])
            @items = @school.items
        else
            flash[:msg] = "That school doesn't exist" if params[:school_id]
            redirect_to schools_path
        end
    end 

    def new
        @item = Item.new
        @school = School.find_by_id(params[:school_id])
    end 

    def create
        @item = Item.create(create_items_params)
        
        if @item.save 
            redirect_to school_path(@item.school_id)
        else 
            render 'new'
        end 
    end 

    def show 
    end 

    def edit 
        @school = School.find_by_id(params[:school_id])
        render 'items/teachers/edit'
    end 
    
    def update 
        if @item.update(update_item_params)
            redirect_to item_path
        else 
            redirect_to schools_path
        end 
    end 

    def donate
    end 

    def donated 
        
        current_user.update(donation_amount: (current_user.donation_amount.to_i - @item.total_cost.to_i))
        @item.update_column(:amount_needed, 0)
        flash[:msg] = "Thanks for your donation"
        redirect_to item_path 
    end

    def destroy 
        @item = Item.find_by_id(params[:id])
        if @item.user_id = current_user.id
            @item.delete 
        else 
            redirect_to item_path
        end 
        redirect_to schools_path
    end 
   

    private 
    def create_items_params
        params.require(:item).permit(:cost, :name, :amount_needed, :school_id, :user_id)
    end 

    def update_item_params
        params.require(:item).permit(:cost, :amount_needed)
    end

    def find_item_id
        @item = Item.find_by(id: params[:id])
        if !@item
          flash[:msg] = "Item was not found"
          redirect_to items_path
        end
    end

    def redirect_if_not_owner
        redirect_to items_path if @item.user != current_user
    end 
end
