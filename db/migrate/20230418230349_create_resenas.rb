class CreateResenas < ActiveRecord::Migration[7.0]
  def change
    create_table :resenas do |t|
      t.text :usuario
      t.text :contenido
      
      t.timestamps
    end
  end
end
