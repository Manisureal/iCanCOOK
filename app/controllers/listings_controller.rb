class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = policy_scope(Listing)
    authorize @listings

    if params[:dates]
      @listings = @listings.where("? = ANY (dates)", params[:dates])
    end

    if params[:query]
      @listings = @listings.where("postcode ILIKE ?", "%#{params[:query]}%")
    end

    if @listings.empty?
      @not_found = true
      @listings = Listing.all
    end

    # @listing_user = @listings.where(@listing.user = current_user)

    @listings = @listings.order(created_at: :desc)
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    authorize @listing
    @last_booking = Booking.where(listing_id: @listing.user.id).last
    @nb_booking = Booking.where(listing_id: @listing.user.id).length
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.dates = params[:listing][:dates].split(", ")
    @listing.events = params[:listing][:events].reject(&:empty?)
    if @listing.save
      redirect_to listing_path(@listing)
    else
     render 'new'
    end
    authorize @listing
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_path
    authorize @listing
  end

  private
  def set_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def listing_params
    params.require(:listing).permit(:events, :photos, :description, :experience, :sort_code, :account_number, :price_amount_pennies, :speciality, :line1, :line2, :city, :postcode, :dates)
  end
end
