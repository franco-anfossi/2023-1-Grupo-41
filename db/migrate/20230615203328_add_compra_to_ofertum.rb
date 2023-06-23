class AddCompraToOfertum < ActiveRecord::Migration[7.0]
  def change
    add_reference :oferta, :compra, null: false, foreign_key: true
  end
end
