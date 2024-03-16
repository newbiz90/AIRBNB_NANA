class Listing < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  def hero_image
    photos.first
  end
end
