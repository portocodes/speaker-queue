class CreateUserAndTalkForeignKey < ActiveRecord::Migration
  def change
    add_column :talks, :user_id, :integer
    add_column :users, :talk_id, :integer
  end
end
