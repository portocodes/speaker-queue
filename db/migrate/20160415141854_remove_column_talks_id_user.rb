class RemoveColumnTalksIdUser < ActiveRecord::Migration
  def change
    remove_column :users, :talk_id
  end
end
