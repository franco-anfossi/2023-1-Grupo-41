class CreateCompras < ActiveRecord::Migration[7.0]
  def change
    create_table :compras do |t|
      t.integer :valor
      
      t.timestamps
    end
  end
end
