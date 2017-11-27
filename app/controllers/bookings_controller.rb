class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.user = current_user
    @booking.listing = @listing
    @booking.duration = (@booking.end_time - @booking.start_time) / 3600
    @booking.total_price = @booking.duration * @listing.price
    if @booking.save
      # raise
      redirect_to dashboard_path
    else
      flash[:alert] = "Booking fields cannot be blank"
      render template: "listings/show"
    end
     authorize @booking
  end

  private
  def booking_params
    params.require(:booking).permit(:booking_date, :start_time, :end_time, :status)
  end
end
