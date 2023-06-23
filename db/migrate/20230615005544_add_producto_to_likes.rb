class AddProductoToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :producto, null: false, foreign_key: true
  end
end
