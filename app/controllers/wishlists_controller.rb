class WishlistsController < ApplicationController
    before_action :authenticate_user!

    def create
        @wishlist = current_user.wishlists.new(wishlist_params)
        if @wishlist.save
            respond_to do |format|
                format.html { redirect_back(fallback_location: root_path, notice: "Added to wishlist") }
                format.turbo_stream { flash.now[:notice] = 'Added to wishlist' }
            end
        else
            flash[:notice] = @wishlist.errors.full_messages.to_sentence
        end
    end

    def destroy
        @wishlist = current_user.wishlists.find(params[:id])
        wishable = @wishlist.wishable
        @wishlist.destroy
        respond_to do |format|
            format.html { format.html { redirect_back(fallback_location: root_path, notice: "Removed from wishlists") } }
            format.turbo_stream { flash.now[:notice] = 'Removed from wishlists' }
        end
    end

    private

        def wishlist_params
            params.require(:wishlist).permit(:wishable_id, :wishable_type)
        end

        def wishable
            @wishable ||= Wishable.find(params[:wishable_id])
        end
end
