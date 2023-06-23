class AddColorToProducto < ActiveRecord::Migration[7.0]
  def change
    add_column :productos, :color, :string
  end
end
