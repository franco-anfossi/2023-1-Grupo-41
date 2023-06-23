class AddUserToSubasta < ActiveRecord::Migration[7.0]
  def change
    add_reference :subasta, :user, null: false, foreign_key: true
  end
end
