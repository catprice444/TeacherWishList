class User < ApplicationRecord
    has_many :items 
    has_many :schools, through: :items
    has_secure_password

    validates :name, uniqueness: {msg: "Username already taken"}, presence: {msg: "Enter a username"}
    validates :role, presence: {msg: "Select a role"}
end
