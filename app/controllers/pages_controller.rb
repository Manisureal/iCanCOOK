class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @bookings = Booking.where(user: @user)
    @last_booking = Booking.where(listing_id: @user.id).last
    @nb_booking = Booking.where(listing_id: @user.id).length
    @listings = Listing.where(user: @user)
    @find_buyer = Booking.where(listing: @user).first.user if @find_buyer
  end

  def confirm
    @user = current_user
    @booking = Booking.where(user: @user).last

  end

end
