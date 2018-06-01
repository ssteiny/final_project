class DrinkOrder < ApplicationRecord
  # Direct associations

  belongs_to :drink

  belongs_to :bar

  # Indirect associations

  # Validations

end
