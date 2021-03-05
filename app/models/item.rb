class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school

  def total_cost
    cost * amount_needed
  end 

end
