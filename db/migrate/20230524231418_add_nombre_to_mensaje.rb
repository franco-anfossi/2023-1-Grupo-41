class AddNombreToMensaje < ActiveRecord::Migration[7.0]
  def change
    add_column :mensajes, :nombre, :string
  end
end
