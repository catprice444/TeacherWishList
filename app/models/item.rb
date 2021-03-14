class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school
  scope :not_donated_item, -> { where('amount_needed > ?',  0) }
  validates :cost, presence: true
  validates :amount_needed, presence: true, on: :create
  validates :name, presence: true
   
  
  def total_cost
    cost * amount_needed
  end 

  

  

  

  

end

