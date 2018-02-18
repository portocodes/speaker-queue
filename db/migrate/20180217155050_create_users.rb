class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :name
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
