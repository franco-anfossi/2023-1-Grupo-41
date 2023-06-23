class AddCalificacionToResena < ActiveRecord::Migration[7.0]
  def change
    add_column :resenas, :calificacion, :integer
  end
end
