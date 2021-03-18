class School < ApplicationRecord
    has_many :items 
    has_many :users, through: :items
    scope :
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true
end
