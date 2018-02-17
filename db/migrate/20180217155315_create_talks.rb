class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :presented, null: false, default: false
      t.string :kind, null: false

      t.references :user, null: false

      t.timestamps
    end
  end
end
