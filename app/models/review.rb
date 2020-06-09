class Review < ApplicationRecord
  validates :title, :artist, :text, :image, presence: true
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader
  
  def self.search(search)
    if search
      Review.where('artist LIKE(?)', "%#{search}%")
    else
      Review.all
    end
  end
end
