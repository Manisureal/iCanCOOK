class PaymentsController < ApplicationController
  before_action :set_booking

  def new

  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )
  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @booking.total_amount_pennies,
    description:  "Payment for cook #{@booking.listing.user.first_name}",
    currency:     @booking.total_amount.currency
  )

  redirect_to dashboard_path

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_listing_booking_payment_path(@booking)
    # ...
  end

private

  def set_booking
    @user = current_user
    @booking = Booking.where(user: @user).last
    authorize @booking
  end
end
