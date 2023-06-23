class CreateOferta < ActiveRecord::Migration[7.0]
  def change
    create_table :oferta do |t|
      t.integer :monto
      t.text :estado
      t.bigint :ofertor

      t.timestamps
    end
  end
end
