class RemoveMasterAdminAndSpeakerFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :master
    remove_column :users, :admin
    remove_column :users, :speaker
  end
end
