class AddColumnSpeakerUser < ActiveRecord::Migration
  def change
    add_column :users, :speaker, :boolean, default: true
  end
end
