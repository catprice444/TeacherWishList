class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school
  validates :cost, presence: true
  validates :amount_needed, presence: true, on: [:create, :edit]
  validates :name, presence: true
  scope :item_order, -> {order(:name)}
   
  
 
  def total_cost
    cost * amount_needed
  end 
  

  

  

  

end

