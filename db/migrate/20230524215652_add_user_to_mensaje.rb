class AddUserToMensaje < ActiveRecord::Migration[7.0]
  def change
    add_reference :mensajes, :user, null: false, foreign_key: true
  end
end
