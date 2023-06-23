class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable  
  
  has_one_attached :imagen

  validates :nombre, presence: true
  validates :password, :length => { :minimum => 6}
  validates :descripcion, presence: true
  validates :telefono, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { is: 9 }
  validates :imagen, presence: true

end
