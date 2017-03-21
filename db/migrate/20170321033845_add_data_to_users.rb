class AddDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :current_weight, :integer
    add_column :users, :target_weight, :integer
  end
end
