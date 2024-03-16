class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  belongs_to :listing

  validates :rating, presence: true, inclusion: { in: 1..5 }
end
