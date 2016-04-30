class AddLocationFieldsForTalks < ActiveRecord::Migration
  def change
    add_column :talks, :location_name, :string
    add_column :talks, :location_coordinates, :string
  end
end
