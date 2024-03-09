class Listing < ApplicationRecord
  belongs_to :user

  has_many_attached :photos

  def hero_image
    photos.first
  end
end
