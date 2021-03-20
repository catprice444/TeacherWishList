module UsersHelper
   
    def teacher_display
        if current_user.items.empty? 
            tag.h3 ("Welcome! Head over to the School Home page to start requesting items")
        else 
            tag.h3 ("Requested items")
        end 
    end 

    
end
