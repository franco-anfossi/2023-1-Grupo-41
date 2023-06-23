class AddUserToOfertum < ActiveRecord::Migration[7.0]
  def change
    add_reference :oferta, :user, null: false, foreign_key: true
  end
end
