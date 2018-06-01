class Drink < ApplicationRecord
  # Direct associations

  has_many   :drink_orders,
             :dependent => :destroy

  # Indirect associations

  has_many   :bars,
             :through => :drink_orders,
             :source => :bar

  # Validations

end
