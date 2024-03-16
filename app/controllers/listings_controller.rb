class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = @listing.reviews
  end
end
