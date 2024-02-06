require "test_helper"

class Host::ListingsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @host = users(:tolase)
    @other_host = users(:john)
    @listing = listings(:condo)
  end

  test "should redirect index when user is not signed in" do
    get host_listings_path
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect new when user is not signed in" do
    get new_host_listing_path
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect create when user is not signed in" do
    assert_no_difference 'Listing.count' do
      post host_listings_path, params: { listings: { title: 'listing title', max_guests: 2 } }
    end
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect show when user is not signed in" do
    get host_listing_path(@listing)
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect edit when user is not signed in" do
    get edit_host_listing_path(@listing)
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect update when user is not signed in" do
    patch host_listing_path(@listing), params: { listings: { title: 'listing title', max_guests: 2 } }
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect delete when user is not signed in" do
    assert_no_difference 'Listing.count' do
      delete host_listing_path(@listing) 
    end
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end
end
