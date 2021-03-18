class User < ApplicationRecord
    has_many :items 
    has_many :schools, through: :items
    has_secure_password

    validates :name, uniqueness: {message: "Username already taken"}, presence: {message: "Enter a username"}
    validates :role, presence: {message: "Select a role"}
end
