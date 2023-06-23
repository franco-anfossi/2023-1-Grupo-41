class AddProductoToCompras < ActiveRecord::Migration[7.0]
  def change
    add_reference :compras, :producto, null: false, foreign_key: true
  end
end
