class AddWishlistsCountToListing < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :wishlists_count, :integer, default: 0
  end
end
