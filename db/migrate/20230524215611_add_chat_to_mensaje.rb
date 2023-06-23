class AddChatToMensaje < ActiveRecord::Migration[7.0]
  def change
    add_reference :mensajes, :chat, null: false, foreign_key: true
  end
end
