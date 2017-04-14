class Meal < ApplicationRecord
  belongs_to :user
  has_many :food_items
  accepts_nested_attributes_for :food_items, :reject_if => proc {|attributes|
    attributes.all? {|k,v| v.blank?}}, allow_destroy: true


    def food_items_attributes=(foods_attributes)
       foods_attributes.values.each do |foods_attribute|
         if foods_attribute[:name] != ""
           food= Food.find_or_create_by(name: foods_attribute[:name])
           self.food_items << food
         end
       end
     end
end
