class AddSubastumToOfertum < ActiveRecord::Migration[7.0]
  def change
    add_reference :oferta, :subastum, null: false, foreign_key: true
  end
end
