class AddFavoritesToWorkouts < ActiveRecord::Migration[5.0]
  def change

    add_column :workouts, :favorites, :boolean

  end
end
