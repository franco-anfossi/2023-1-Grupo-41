class AddDescripcionToCompra < ActiveRecord::Migration[7.0]
  def change
    add_column :compras, :descripcion, :string
  end
end
