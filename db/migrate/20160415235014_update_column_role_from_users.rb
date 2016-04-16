class UpdateColumnRoleFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, default: "coder"
  end
end
