class Mensaje < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  validates :contenido, presence: true
  validates :nombre, presence: true
  validates :emisor, presence: true
end
