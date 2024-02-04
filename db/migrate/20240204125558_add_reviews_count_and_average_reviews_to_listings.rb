class AddReviewsCountAndAverageReviewsToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :reviews_count, :integer, default: 0
    add_column :listings, :average_rating, :decimal, default: 0
  end
end
