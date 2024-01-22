# == Schema Information
#
# Table name: listing_photos
#
#  id         :bigint           not null, primary key
#  caption    :string
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#
# Indexes
#
#  index_listing_photos_on_listing_id  (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#
require "test_helper"

class ListingPhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
