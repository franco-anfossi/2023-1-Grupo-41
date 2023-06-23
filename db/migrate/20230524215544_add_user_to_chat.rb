class AddUserToChat < ActiveRecord::Migration[7.0]
  def change
    add_reference :chats, :user, null: false, foreign_key: true
  end
end
