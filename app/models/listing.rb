class Listing < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos

  def hero_image
    photos.first
  end
end
