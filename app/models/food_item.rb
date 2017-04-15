class FoodItem < ApplicationRecord
  belongs_to :meal
  validates :serving_size, :calories, :num_servings, :name,  presence: true
end
