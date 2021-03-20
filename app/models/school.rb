class School < ApplicationRecord
    has_many :items 
    has_many :users, through: :items
    
    validates :name, presence: true, uniqueness: {message: "This school already exists"}
    validates :location, presence: true

    scope :school_order, -> {order(:name)}
    
end
