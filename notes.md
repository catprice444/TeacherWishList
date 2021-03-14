Teacher Wish List App

User
    -string: name
    -string: password
    -integer: role
    -integer: donation_amount

    -has many items 
    -has many schools through items 

School
    -string: location
    -string: name 

    -has many items
    -has many users through items 


Items 
    -integer: cost
    -string: name 
    -integer: amount_needed
    -integer: school_id
    -integer: user_id

    -belongs to user
    -belongs to school




<% if current_user %>
        #   <a class="navbar-brand" href="<%= user_path(current_user) %>"/><%= current_user.name %></a>
        #   <a class="navbar-brand" href="<%= logout_path %>"/>Log Out</a>
        # <% else %>
        #   <a class="navbar-brand" href="<%= new_user_path %>"/>Sign Up</a>
        #   <a class="navbar-brand" href="<%= signin_path %>"/>Log in</a>
        # <% end %> 

enough_money = (current_user.donation_amount > (@item.cost * @item.amount_needed))
        check_donation = current_user.donation_amount > @item.amount_needed

            if !check_donation
                flash[:message] = "Too many units"
            else 
                current_user.update(donation_amount: ((current_user.donation_amount - (@item.cost * current_user.donation_amount.to_i))))
                @item.update(units_donated: :units_donated, amount_needed: (@item.amount_needed - current_user.donation_amount.to_i))
                if @item.save && current_user.save
                    flash[:message] = "Thanks!"
                else 
                    flash[:message] = "Wrong"
                end
            
            end  

