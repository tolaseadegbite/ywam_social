require "test_helper"

class ListingDeletionTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @listing = listings(:condo)
    @base_title = 'YWAM Extra'
    sign_in @user
  end

  test "delete listing" do
    delete host_listing_path(@listing)
    assert_not flash.empty?
    @listing.reload
    assert_equal 'archived', @listing.status
  end
end
