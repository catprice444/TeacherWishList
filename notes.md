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
           

 <div class="field<%= 'field_with_errors' if @item.errors[:school_id].any? %>">
        <p> School Name: </p>
        <%= f.select :school_id, options_for_select(@schools.map {|school| [school.name, school.id]}), :prompt=>"Select Your School" %><br><br>
    </div>