class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.string :speaker

      t.timestamps null: false
    end
  end
end
