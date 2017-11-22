class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render 'new'
    end
    authorize @booking
  end

  private
  def booking_params
    params.require(:booking).permit(:booking_date, :status)
  end
end
