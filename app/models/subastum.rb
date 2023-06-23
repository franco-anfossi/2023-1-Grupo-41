class Subastum < ApplicationRecord
  belongs_to :user
  belongs_to :producto
  belongs_to :compra
  has_many :oferta, dependent: :destroy
  validates :base, presence: true
  validates :estado, presence: true
end
