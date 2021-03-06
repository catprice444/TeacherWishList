class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school

  def total_cost
    cost * amount_needed
  end 

  def quantity_donated
    amount_needed - 
  end 

  def donation

  end 

end
