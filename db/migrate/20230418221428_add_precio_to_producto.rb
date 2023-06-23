class AddPrecioToProducto < ActiveRecord::Migration[7.0]
  def change
    add_column :productos, :precio, :integer
  end
end
