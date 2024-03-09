class BookingsController < ApplicationController
  def new
    @listing = Listing.first
    @booking = Booking.new
  end
end
