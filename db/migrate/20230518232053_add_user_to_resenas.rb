class AddUserToResenas < ActiveRecord::Migration[7.0]
  def change
    add_reference :resenas, :user, null: false, foreign_key: true
  end
end
