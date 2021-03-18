class School < ApplicationRecord
    has_many :items 
    has_many :users, through: :items
    scope :school_order, -> {order(:name)}
    validates :name, presence: {message: "Enter the school's Name"}, uniqueness: {message: "School name already entered"}
    validates :location, presence: {message: "Enter the school's location"}
end
