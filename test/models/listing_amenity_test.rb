# == Schema Information
#
# Table name: listing_amenities
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amenity_id :bigint           not null
#  listing_id :bigint           not null
#
# Indexes
#
#  index_listing_amenities_on_amenity_id  (amenity_id)
#  index_listing_amenities_on_listing_id  (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (amenity_id => amenities.id)
#  fk_rails_...  (listing_id => listings.id)
#
require "test_helper"

class ListingAmenityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end