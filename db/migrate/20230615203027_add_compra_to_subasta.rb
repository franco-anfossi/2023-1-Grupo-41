class AddCompraToSubasta < ActiveRecord::Migration[7.0]
  def change
    add_reference :subasta, :compra, null: false, foreign_key: true
  end
end
