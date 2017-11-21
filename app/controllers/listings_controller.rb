class ListingsController < ApplicationController
  before_action :set_listing, only: [:index, :show, :create, :edit, :update, :destroy]
  def index
    @listings = Listing.all
    authorize @listings
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
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
    params.require(:listing).permit(:events, :start_date, :end_date, :photos, :description, :experience, :sort_code, :account_number, :price, :speciality, :line1, :line2, :city, :postcode)
  end
end
