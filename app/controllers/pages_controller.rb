class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @bookings = Booking.where(user: @user)
    @listings = Listing.where(user: @user)
    @find_buyer = Booking.where(listing: @user).first.user if @find_buyer
  end
end
