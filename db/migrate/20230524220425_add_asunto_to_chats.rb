class AddAsuntoToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :asunto, :string
  end
end
