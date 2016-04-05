class AddStatusTalks < ActiveRecord::Migration
  def change
    add_column :talks, :state, :string, :default => "pending"
  end
end
