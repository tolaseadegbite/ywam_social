# == Schema Information
#
# Table name: rooms
#
#  id             :bigint           not null, primary key
#  number_of_room :integer          default(1), not null
#  room_type      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  listing_id     :bigint           not null
#
# Indexes
#
#  index_rooms_on_listing_id  (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#
require "test_helper"

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
