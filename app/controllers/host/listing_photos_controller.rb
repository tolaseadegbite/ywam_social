class Host::ListingPhotosController < ApplicationController
    before_action :authenticate_user!
    before_action :find_listing
    before_action :find_listing_photo, only: [:destroy]

    def index
      @listing_photos = @listing.listing_photos
    end

    def new
      @listing_photo = ListingPhoto.new
    end

    def create
      @listing_photo = @listing.listing_photos.build(listing_photo_params)
        if @listing_photo.save
            respond_to do |format|
                format.html { redirect_to host_listing_path(@listing), notice: 'Photo was successfully created' }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @listing_photo.destroy
        respond_to do |format|
            format.html { redirect_to host_listing_path(@listing), notice: 'Photo was successfully deleted' }
        end
    end

    private

        def listing_photo_params
            params.require(:listing_photo).permit(:caption, :photo)
        end

        def find_listing
          @listing = current_user.listings.find(params[:listing_id])
        end

        def find_listing_photo
          @listing_photo = @listing.listing_photos.find(params[:id])
        end
end
