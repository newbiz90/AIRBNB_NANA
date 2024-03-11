class ReviewsController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> d99a6ce (add files)
<<<<<<< HEAD
=======

>>>>>>> 0623650 (add reviews files)
<<<<<<< HEAD
=======
>>>>>>> 3ec17c2 (added reviews files)
=======
>>>>>>> 23db50b48f0bc4780fd8088a3779dd19fc8bbcf7
>>>>>>> d99a6ce (add files)
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
