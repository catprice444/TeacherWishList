module ItemsHelper

    def item_index_page_links
        if current_user.role == 1
            tag.p(link_to "Add Item", new_school_item_path)
        end 
    end

    def item_show_page_links
        if current_user.role == 1
            tag.p(link_to "Edit Item", edit_school_item_path(@item))
            
        else 
            if @item.amount_needed != 0 
                tag.p(link_to "Donate Now!", donate_item_path(@item))
            end 
            tag.h3("You have this much to donate: $#{current_user.donation_amount}")
        end 
    end 

    def delete_button 
        if current_user.role == 1
            (button_to 'Delete Item', @item, method: :delete)
        end 
    end 
end
