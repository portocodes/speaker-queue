class AddDateAndVideoAndResourceFieldToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :video, :string
    add_column :talks, :resource, :string
    add_column :talks, :date_event, :date
  end
end
