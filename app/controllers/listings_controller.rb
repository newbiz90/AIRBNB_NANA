class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.find_by(listing: @listing, user: current_user)
    @review = Review.new
    @reviews = @listing.reviews
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path, notice: 'Listing was successfully created.' # Redirect to the index action
    else
      render :new
    end
  end

  def index
    @listings = Listing.includes(:user).all
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :price)
  end
end
