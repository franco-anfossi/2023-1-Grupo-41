class Chat < ApplicationRecord
  belongs_to :user
  has_many :mensajes, dependent: :destroy
  
  validates :asunto, presence: :true
end
