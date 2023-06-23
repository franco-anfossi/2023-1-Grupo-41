class AddAttrToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :descripcion, :text
    add_column :admin_users, :telefono, :integer
  end
end
