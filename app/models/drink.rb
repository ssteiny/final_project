class Drink < ApplicationRecord
  # Direct associations

  has_many   :drink_orders,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
