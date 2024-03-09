class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def landing
  end

  def hosting
    my_listings = current_user.listings

    @pending_bookings = Booking
    .where(listing: my_listings)
    .where(status: "pending")

    @upcoming_bookings = Booking
    .where(listing: my_listings)
    .where(status: "confirmed")
    .where("start_date > ?", Date.today)

    @past_bookings = Booking
    .where(listing: my_listings)
    .where(status: "confirmed")
    .where("end_date < ?", Date.today)
  end
end
