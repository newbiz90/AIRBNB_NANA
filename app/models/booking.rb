class Booking < ApplicationRecord
  STATUSES = %w[pending confirmed declined].freeze

  belongs_to :user
  belongs_to :listing
  has_one :review, dependent: :restrict_with_error

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: STATUSES }
end
