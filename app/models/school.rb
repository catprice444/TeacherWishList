class School < ApplicationRecord
    has_many :items 
    has_many :users, through: :items
    validates :name, uniqueness: true, presence: true
    validates :location, presence: true
end
