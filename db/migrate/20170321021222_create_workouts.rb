class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.text :content
      t.integer :calories_burned
      t.integer :duration
      t.integer :user_id 
      t.timestamps null: false

      t.timestamps
    end
  end
end
