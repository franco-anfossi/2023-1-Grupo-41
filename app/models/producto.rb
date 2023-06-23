class Producto < ApplicationRecord
  belongs_to :user
  has_many :resenas, dependent: :destroy
  has_many :compras, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :subasta, through: :compras, dependent: :destroy
  has_many :oferta, through: :subasta, dependent: :destroy
  has_one_attached :imagen
  validates :name, presence: true
  validates :talla, presence: true, numericality: { greater_than_or_equal_to: 35, less_than_or_equal_to: 46 }
  validates :precio, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  has_one_attached :imagen
  validates :imagen, presence: true
end
