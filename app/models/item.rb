class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school
  validates :cost, presence: {:message => "Enter cost of item" }
  validates :amount_needed, presence: {:message => "Enter amount needed" }, on: [:create, :edit]
  validates :name, presence: {:message => "Enter name of item" }
  scope :item_order, -> {order(:name)}
   
  
 
  def total_cost
    cost * amount_needed
  end 
  

  

  

  

end

