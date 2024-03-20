class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.where(listing: @listing, user: current_user).order(created_at: :desc).first
    @review = Review.new
    @reviews = @listing.reviews
    @host = @listing.user

  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listingtest_path(@listing), notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  def index
    @listings = Listing.includes(:user).all
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :photos)
  end
end
