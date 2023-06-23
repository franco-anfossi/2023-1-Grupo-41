class Ofertum < ApplicationRecord
  belongs_to :user
  belongs_to :producto
  belongs_to :compra
  belongs_to :subastum
  validates :monto, presence: true
  validates :estado, presence: true
  validates :ofertor, presence: true
end
