class AddMonthFieldToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :month, :string
  end
end
