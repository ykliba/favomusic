class Review < ApplicationRecord
  belongs_to :user, optional: true
  has_many :coments

  validates :title, :artist, :text, :image, presence: true

  
end
