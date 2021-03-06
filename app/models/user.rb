class User < ApplicationRecord
    has_many :items 
    has_many :schools, through: :items
    has_secure_password

    def teacher 
        @user.role == 1 
    end 

    def donor 
        @user.role == 2
    end 
end
