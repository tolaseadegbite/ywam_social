# == Schema Information
#
# Table name: listings
#
#  id              :bigint           not null, primary key
#  about           :text
#  address_line_1  :string
#  address_line_2  :string
#  city            :string
#  country         :string
#  furniture       :integer          default("unfurnished")
#  lat             :decimal(10, 6)
#  listing_type    :integer          default("cabin")
#  lng             :decimal(10, 6)
#  max_guests      :integer          default(1)
#  postal_code     :string
#  size            :integer
#  state           :string
#  status          :integer          default("draft")
#  title           :string           not null
#  wishlists_count :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  host_id         :bigint           not null
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
  def setup
    @user = users(:tolase)
    @listing = @user.listings.build(title: "Best in Mexico city", max_guests: 3)
  end

  test 'listing should be valid' do
    assert @listing.valid?
  end

  test "title must be present" do
    @listing.title = nil
    assert_not @listing.valid?
  end

  test "max guests must be greater than zero" do
    @listing.max_guests = 0
    assert_not @listing.valid?
  end

  test "max guests must be less than than 101" do
    @listing.max_guests = 101
    assert_not @listing.valid?
  end

  test 'should delete associated rooms when listing is destroyed' do
    # sign_in @user
    @listing.save
    @listing.rooms.create!(room_type: "Apartment", number_of_room: 2)
    assert_difference 'Room.count', -1 do
      @listing.destroy
    end
  end
end
