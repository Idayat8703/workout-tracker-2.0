class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :workout, index: true, foreign_key: true
      t.timestamps null: false

      t.timestamps
    end
  end
end
