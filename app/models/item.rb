class Item < ApplicationRecord
  belongs_to :user
  belongs_to :school

  def total_cost
    cost + amount_needed
  end 

  def enough_money?
    total_cost >= current_user.donation_amount 
  end 

  def donation
    if !enough_money?
      "Sorry you don't have enough money"
    else 
      item.update(amount_needed: (user.units_donated - amount_needed))
    end 
  end 

  

end

# user has donation_amount which is dollar amount 
# item has total_cost which is dollar amount
# item has amount_need which is units 
# item has cost which is dollar amount per unit 

# in the end I want to be able to take the donation_amount and subtract it from total_cost so the amount_needed is updated 
# donation form will show the donor how much money they plan to donate
# also show the item total cost, cost per unit and amount needed 
# amount_donated will be a field where the donor can input a number of how many units they want to donate

# create def enough_money? which checks amount donated cost vs a users total donation amount
# if this is valid, then subtract the amount_donated from the amount_needed and update amount_needed
# if its not valid, then throw error message