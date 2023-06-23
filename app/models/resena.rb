class Resena < ApplicationRecord
  belongs_to :user
  belongs_to :producto

  validates :usuario, presence: true
  validates :contenido, presence: true
  validates :calificacion, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
