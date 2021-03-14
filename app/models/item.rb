class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school
  
  def donation 
    @user.update(donation_amount: (@user.donation_amount.to_i - total_cost.to_i))
  end 
  
  def total_cost
    cost * amount_needed
  end 

  def enough_money?
    user.donation_amount.to_i >= (cost * amount_needed)
  end 


  

  

  

end

