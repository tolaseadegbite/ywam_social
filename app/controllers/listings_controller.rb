class ListingsController < ApplicationController

  def index
    @listings = Listing.published.ordered
  end

  def show
    @listing = Listing.published.find(params[:id])
  end
end
