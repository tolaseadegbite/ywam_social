class Host::RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_listing
    before_action :find_room, only: [:edit, :update, :destroy]

    def index
      @rooms = @listing.rooms
    end

    def new
      @room = Room.new
      @bed = @room.beds.build
    end

    def create
      @room = @listing.rooms.build(room_params)
        if @room.save
            respond_to do |format|
                format.html { redirect_to host_listing_path(@listing), notice: 'Room was successfully created' }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @bed = @room.beds.build
    end

    def update
        if @room.update(room_params)
            respond_to do |format|
                format.html { redirect_to host_listing_path(@listing), notice: 'Room was successfully updated' }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @room.destroy
        respond_to do |format|
            format.html { redirect_to host_listing_path(@listing), notice: 'Room was successfully deleted' }
        end
    end

    private

        def room_params
            params.require(:room).permit(:room_type, :number_of_room, bed_attributes: [:id, :_destroy, :bed_size, :number_of_bed])
        end

        def find_listing
          @listing = current_user.listings.find(params[:listing_id])
        end

        def find_room
          @room = @listing.rooms.find(params[:id])
        end
end
