class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @listing = Listing.find(params[:listing_id])
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)

  end
end
