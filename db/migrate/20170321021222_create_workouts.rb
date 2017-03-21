class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.date :date
      t.integer :duration
      t.string :location
      t.timestamps null: false

      t.timestamps
    end
  end
end
