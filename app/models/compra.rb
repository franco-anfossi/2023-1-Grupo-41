class Compra < ApplicationRecord
  belongs_to :user
  belongs_to :producto
  has_many :subasta, dependent: :destroy
  has_many :oferta, through: :subasta, dependent: :destroy
  validates :valor, presence: true
  validates :descripcion, presence: true
  validates :estado, presence: true
end
