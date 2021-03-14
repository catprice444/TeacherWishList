class User < ApplicationRecord
    has_many :items 
    has_many :schools, through: :items
    has_secure_password

    scope :donor, -> { where(role: 2) }
    scope :teacher, -> { where(role: 1) }
end
