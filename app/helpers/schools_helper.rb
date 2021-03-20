module SchoolsHelper
    def school_index_page_links
        if current_user.role == 1
            tag.p(link_to('New School', new_school_path))
        end 
    end 

    def school_show_page_links
        if current_user.role == 1
            tag.p(link_to "Add Item", new_school_item_path(@school))
        else 
        tag.p(Click on the item to donate)
        end 
    end 
end
