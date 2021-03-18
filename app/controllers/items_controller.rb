class ItemsController < ApplicationController
    before_action :school_id, only: [:index, :new, :create, :edit, :update]
    before_action :item_id, only: [:show, :edit, :update, :donate, :donated]
    before_action :redirect_if_not_owner, only: [:edit, :update]

    def index 
        @items = @school.items
    end 

    def new
        @item = @school.items.new
    end 

    def create
        @item = @school.items.create(create_items_params)
        if @item.save
            redirect_to school_path(@item.school_id)
        else 
            render 'new'
        end 
    end 

    def show 
    end 

    def edit 
        render 'items/teachers/edit'
    end 
    
    def update 
        if @school.items.update(update_item_params)
            redirect_to item_path
        else 
            redirect_to schools_path
        end 
    end 

    def donate
        render 'items/donors/donate'
    end 

    def donated 
        if current_user.donation_amount >= @item.total_cost
            current_user.update(donation_amount: (current_user.donation_amount.to_i - @item.total_cost.to_i))
            @item.update_column(:amount_needed, 0)
            flash[:msg] = "Thanks for your donation"
        else 
            flash[:msg] = "Sorry, you don't have enough money"
        end 
        redirect_to item_path 
    end

    def destroy 
        @item = Item.find_by_id(params[:id])
        if @item.user_id == current_user.id
            @item.delete 
        else 
            flash[:msg] = "You cannot delete that item"
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

    def school_id
        @school = School.find_by_id(params[:school_id])
    end 

    def item_id
        @item = Item.find_by_id(params[:id])
    end

    def redirect_if_not_owner
        redirect_to items_path if @item.user != current_user
    end 
end
