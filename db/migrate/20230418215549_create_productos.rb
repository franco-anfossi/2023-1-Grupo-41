class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.text :name
      t.integer :talla

      t.timestamps
    end
  end
end
