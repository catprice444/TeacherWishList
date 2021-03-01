Teacher Wish List App

User
    -string: name
    -string: password
    -string: user_type
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


