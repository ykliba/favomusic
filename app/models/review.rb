class Review < ApplicationRecord
  belongs_to :user
  has_many :coments

  validates :title, :artist, :text, :image, presence: true

  
end
