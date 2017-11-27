class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
    authorize @listings
    if params[:dates]
      @listings = policy_scope(Listing).where("dates = ?", "{#{params[:dates]}}")
    elsif params[:query]
      @listings = policy_scope(Listing).where("postcode ILIKE ?", "%#{params[:query]}%")
    else
    @listings = policy_scope(Listing).order(created_at: :desc)
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    authorize @listing
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
    params.require(:listing).permit(:events, :photos, :description, :experience, :sort_code, :account_number, :price, :speciality, :line1, :line2, :city, :postcode, :dates)
  end
end
