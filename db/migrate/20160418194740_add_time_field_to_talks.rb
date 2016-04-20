class AddTimeFieldToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :time_event, :Datetime
    remove_column :talks, :date_event
  end
end
