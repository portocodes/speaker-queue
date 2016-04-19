class AddTimeFieldToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :time_event, :Time
  end
end
