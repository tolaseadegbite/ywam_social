# == Schema Information
#
# Table name: listings
#
#  id             :bigint           not null, primary key
#  about          :text
#  address_line_1 :string
#  address_line_2 :string
#  city           :string
#  country        :string
#  lat            :decimal(10, 6)
#  listing_type   :integer          default("cabin")
#  lng            :decimal(10, 6)
#  max_guests     :integer          default(1)
#  postal_code    :string
#  state          :string
#  status         :integer          default("draft")
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  host_id        :bigint           not null
#
# Indexes
#
#  index_listings_on_host_id  (host_id)
#
# Foreign Keys
#
#  fk_rails_...  (host_id => users.id)
#
require "test_helper"

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
