class Bar < ApplicationRecord
  # Direct associations

  has_many   :drink_orders,
             :dependent => :destroy

  has_many   :food_orders,
             :dependent => :destroy

  # Indirect associations

  has_many   :drinks,
             :through => :drink_orders,
             :source => :drink

  has_many   :foods,
             :through => :food_orders,
             :source => :food

  # Validations

end
