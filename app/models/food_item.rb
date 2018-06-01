class FoodItem < ApplicationRecord
  # Direct associations

  has_many   :food_orders,
             :foreign_key => "food_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
