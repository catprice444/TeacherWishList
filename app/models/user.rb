class User < ApplicationRecord
    has_many :items 
    has_many :schools, through: :items
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 

end
