class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])

    if @review.save
      redirect_to flat_path(@review.booking.flat, anchor: "review-#{@review.id}")
    else
      render :new
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
