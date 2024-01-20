# == Schema Information
#
# Table name: beds
#
#  id            :bigint           not null, primary key
#  bed_size      :integer
#  number_of_bed :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  room_id       :bigint           not null
#
# Indexes
#
#  index_beds_on_room_id  (room_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#
require "test_helper"

class BedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
