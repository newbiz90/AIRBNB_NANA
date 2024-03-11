class ReviewsController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 0623650 (add reviews files)
=======
>>>>>>> 3ec17c2 (added reviews files)
  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])

    if @review.save
      redirect_to flat_path(@review.booking.flat, anchor: "review-#{@review.id}")
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
