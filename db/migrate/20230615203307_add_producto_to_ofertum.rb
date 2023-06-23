class AddProductoToOfertum < ActiveRecord::Migration[7.0]
  def change
    add_reference :oferta, :producto, null: false, foreign_key: true
  end
end
