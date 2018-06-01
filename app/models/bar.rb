class Bar < ApplicationRecord
  # Direct associations

  has_many   :food_orders,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
