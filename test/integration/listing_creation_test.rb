require "test_helper"

class ListingCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @listing = listings(:condo)
    @base_title = 'YWAM Extra'
    sign_in @user
  end

  test "do not create listing with invalid information" do
    get new_host_listing_path
    assert_template 'host/listings/new'
    assert_select 'title', "New listing | #{@base_title}"
    assert_no_difference 'Listing.count' do
      post host_listings_path, params: { listing: { title: '' } }
    end
    assert_response :unprocessable_entity
    assert_template 'host/listings/new'
    assert_select 'div.text-danger'
  end

  test "create listing with valid information" do
    assert_difference 'Listing.count', 1 do
      post host_listings_path, params: { listing: { title: 'nice listing', max_guests: 1 } }
    end
    follow_redirect!
    assert_template 'listings/show'
    assert_not flash.empty?
  end
end
