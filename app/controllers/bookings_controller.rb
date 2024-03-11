class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @listing = Listing.first # Replace with your logic to get the current listing
  end

  def create
    # Step 1: Fetch parameters
    booking_params = params.require(:booking).permit(:start_date, :end_date)

    # Step 2: Create a new booking associated with the current user
    @booking = current_user.bookings.build(booking_params)
    @booking.listing = Listing.first # Replace with your logic to get the current listing
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
end
