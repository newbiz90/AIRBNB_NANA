class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user

    if @review.save
      redirect_to @booking.listing, notice: 'Review saved' # Redirect to the index action
    else
      redirect_to @booking.listing, notice: 'Review saved' # Redirect to the index action
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
