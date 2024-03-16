class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    # @reviews = [Review.find(1)]
    @reviews = @listing.reviews
  end
end
