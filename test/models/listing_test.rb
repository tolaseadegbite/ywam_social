# == Schema Information
#
# Table name: listings
#
#  id              :bigint           not null, primary key
#  about           :text
#  address_line_1  :string
#  address_line_2  :string
#  average_rating  :decimal(, )      default(0.0)
#  city            :string
#  country         :string
#  furniture       :integer          default("unfurnished")
#  lat             :decimal(10, 6)
#  listing_type    :integer          default("cabin")
#  lng             :decimal(10, 6)
#  max_guests      :integer          default(1)
#  postal_code     :string
#  reviews_count   :integer          default(0)
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
    @host = users(:tolase)
    @listing = @host.listings.build(title: "Basement", max_guests: 3)
  end

  test 'listing must be valid' do
    assert @listing.valid?
  end

  test "title must be present" do
    @listing.title = nil
    assert_not @listing.valid?
  end

  test 'max_guests must be present' do
    @listing.max_guests = nil
    assert_not @listing.valid?
  end

  test 'max_guests must be greater than 0' do
    @listing.max_guests = 0
    assert_not @listing.valid?
  end

  test 'max_guests must be less than 101' do
    @listing.max_guests = 102 
    assert_not @listing.valid?
  end
end
