class AddProductoToSubasta < ActiveRecord::Migration[7.0]
  def change
    add_reference :subasta, :producto, null: false, foreign_key: true
  end
end
