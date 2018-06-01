class FoodOrder < ApplicationRecord
  # Direct associations

  belongs_to :food,
             :class_name => "FoodItem"

  belongs_to :bar

  # Indirect associations

  # Validations

end
