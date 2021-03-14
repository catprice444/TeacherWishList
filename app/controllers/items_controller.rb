class ItemsController < ApplicationController
    

    def new
        @item = Item.new
        @schools = School.all
    end 

    def create
        @item = Item.create(item_params)
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
        @item = Item.find_by_id(params[:id])
        user = current_user
        user.update(donation_amount: (user.donation_amount.to_i - @item.total_cost.to_i))
        @item.update_column(:amount_needed, 0)
            flash[:message] = "Thanks for your donation"
     
        redirect_to item_path 
    end
   

    private 
    def item_params
        params.require(:item).permit(:cost, :name, :amount_needed, :school_id, :user_id)
    end 

    def donation_params
        params.permit(:units_donated)
    end 

     
end
