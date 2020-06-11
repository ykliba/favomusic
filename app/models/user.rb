class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews 
  has_many :comments 

  # validates :nickname, presence: true, length: { maximum: 8 }
end
