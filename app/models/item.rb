class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school
  
  scope :item_order, -> {order(:name)}
  
  validates :cost, :name, presence: true

  def total_cost
    cost * amount_needed
  end 
  

  

  

  

end

