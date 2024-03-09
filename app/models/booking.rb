class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_one :review, dependent: :restrict_with_error
end
