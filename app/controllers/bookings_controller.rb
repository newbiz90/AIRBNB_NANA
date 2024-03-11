class BookingsController < ApplicationController
  def create
    # Step 2: Create a new booking associated with the current user
    @booking = current_user.bookings.build(booking_params)
    @booking.listing = Listing.find(params[:listing_id])
    @booking.status = 'confirmed'

    # Step 3: Save the booking to the database
    if @booking.save
      # Step 4 (Success): Redirect to a success page or perform other actions
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      # Step 4 (Failure): Render the new action with an error message
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
