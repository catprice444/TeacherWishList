class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school
  scope :not_donated_item, -> { where('amount_needed > ?',  0) }
  
   
  
  def total_cost
    cost * amount_needed
  end 

  

  

  

  

end

