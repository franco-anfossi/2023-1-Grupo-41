class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :productos, dependent: :destroy
  has_many :compras, through: :productos, dependent: :destroy
  has_many :resenas, through: :productos, dependent: :destroy
  has_many :subasta, through: :compras, dependent: :destroy
  has_many :oferta, through: :subasta, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :mensajes, through: :chats, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :imagen

  validates :name, presence: true
  validates :imagen, presence: true
  validates :descripcion, presence: true
  validates :telefono, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { is: 9 }
end
