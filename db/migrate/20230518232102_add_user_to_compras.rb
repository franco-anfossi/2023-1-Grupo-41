class AddUserToCompras < ActiveRecord::Migration[7.0]
  def change
    add_reference :compras, :user, null: false, foreign_key: true
  end
end
