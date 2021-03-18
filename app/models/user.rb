class User < ApplicationRecord
    has_many :items 
    has_many :schools, through: :items
    has_secure_password

    validates :name, uniqueness: true, :presence => {:message => "Username already taken"}
    validates :role, presence: true
end
