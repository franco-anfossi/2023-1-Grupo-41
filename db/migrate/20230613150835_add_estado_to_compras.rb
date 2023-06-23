class AddEstadoToCompras < ActiveRecord::Migration[7.0]
  def change
    add_column :compras, :estado, :string
  end
end
