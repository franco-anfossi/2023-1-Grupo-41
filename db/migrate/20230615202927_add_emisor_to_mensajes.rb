class AddEmisorToMensajes < ActiveRecord::Migration[7.0]
  def change
    add_column :mensajes, :emisor, :integer
  end
end
