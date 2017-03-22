class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :meal_id
      t.integer :serving_size
      t.integer :num_servings
      t.integer :calories, :default => 0

      t.timestamps
    end
  end
end
