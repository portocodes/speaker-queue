class CreateUserAndTalkForeignKey < ActiveRecord::Migration
  def change
    add_reference :talks, :user, index: true
    add_reference :users, :talk, index: true
  end
end
