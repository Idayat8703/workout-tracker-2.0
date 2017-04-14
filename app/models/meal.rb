class Meal < ApplicationRecord
  belongs_to :user
  has_many :food_items
  has_many :workouts

  accepts_nested_attributes_for :food_items
end
