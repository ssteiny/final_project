class FoodItem < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :food_orders,
             :foreign_key => "food_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :bars,
             :through => :food_orders,
             :source => :bar

  # Validations

end
