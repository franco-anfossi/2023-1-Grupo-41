class CreateMensajes < ActiveRecord::Migration[7.0]
  def change
    create_table :mensajes do |t|
      t.text :contenido

      t.timestamps
    end
  end
end
