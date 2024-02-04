class ListingsController < ApplicationController

  def index
    @listings = Listing.published.ordered
  end

  def show
    @listing = Listing.published.find(params[:id])
    @review = Review.new
    @reviews = @listing.reviews.includes(:user)
    @reviewable = @listing
  end
end
