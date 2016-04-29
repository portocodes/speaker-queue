class AddDateAndVideoAndResourceFieldToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :video, :string, default: nil
    add_column :talks, :resource, :string, default: nil
    add_column :talks, :date_event, :date
  end
end
