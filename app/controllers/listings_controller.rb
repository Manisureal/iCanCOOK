class ListingsController < ApplicationController
  before_action :set_listing, only: [:index, :show, :create, :edit, :update, :destroy]
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
     render 'new'
    end
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
  end

  private
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:events, :start_date, :end_date, :photos, :description, :experience, :sort_code, :account_number, :price, :speciality, :line1, :line2, :city, :postcode)
  end
end
