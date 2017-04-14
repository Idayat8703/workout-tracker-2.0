class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :meal_type
      t.integer :user_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
