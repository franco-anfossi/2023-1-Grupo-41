class AddAdminToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :admin, :boolean, default: true
  end
end
