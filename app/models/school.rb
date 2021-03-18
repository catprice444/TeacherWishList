class School < ApplicationRecord
    has_many :items 
    has_many :users, through: :items
    scope :school_order, -> {order(:name)}
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true
end
