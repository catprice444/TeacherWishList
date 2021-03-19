class User < ApplicationRecord
    has_many :items 
    has_many :schools, through: :items
    has_secure_password

    validates :name, :email, presence: true, uniqueness: true
    validates :role, presence: true
    
end
