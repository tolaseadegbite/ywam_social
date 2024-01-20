class Host::ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_listing, only: [:show, :edit, :update, :destroy]

    def index
      @listings = current_user.listings
    end

    def new
      @listing = Listing.new
    end

    def create
        @listing = current_user.listings.build(listing_create_params)
        if @listing.save
            respond_to do |format|
                format.html { redirect_to host_listing_path(@listing), notice: "Listing successfully created" }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
      # @room = Room.new
    end

    def edit
      
    end

    def update
        if @listing.update(listing_update_params)
            respond_to do |format|
                format.html { redirect_to host_listing_path(@listing), notice: "Listing updated successfully" }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
      @listing.update(status: :archived)
      redirect_to host_listings_path, notice: "Listing archived!"
    end

    private

        def find_listing
          @listing ||= current_user.listings.find(params[:id])
        end

        def listing_create_params
          params.require(:listing).permit(:title, :about, :max_guests, :address_line_1, :address_line_2, :city, :state, :postal_code, :country, :status, :listing_type)
        end

        def listing_update_params
            params.require(:listing).permit(:title, :about, :max_guests, :city, :state, :postal_code, :country, :status, :listing_type)
        end
end
