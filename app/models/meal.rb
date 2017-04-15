class Meal < ApplicationRecord
  belongs_to :user
  has_many :food_items
  validate :meal_type
  accepts_nested_attributes_for :food_items, :reject_if => proc {|attributes|
    attributes.all? {|k,v| v.blank?}}, allow_destroy: true

  def food_items_attributes=(foods_attributes)
    # foods_attributes.values.each do |foods_attribute|
        # food_item = FoodItem.find_or_create_by(name: foods_attributes[:name], serving_size: foods_attributes[:serving_size], num_servings: foods_attributes[:num_servings], calories: foods_attributes[:calories])
        food_item = FoodItem.find_or_create_by(foods_attributes)
        self.food_items << food_item
  end
end
