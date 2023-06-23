class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :nombre
      t.string :direccion
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
