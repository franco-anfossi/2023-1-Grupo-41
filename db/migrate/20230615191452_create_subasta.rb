class CreateSubasta < ActiveRecord::Migration[7.0]
  def change
    create_table :subasta do |t|
      t.integer :base
      t.text :estado

      t.timestamps
    end
  end
end
