require "test_helper"

class ListingEditingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @listing = listings(:condo)
    @base_title = 'YWAM Extra'
    sign_in @user
  end

  test "do not edit listing with an invalid information" do
    get edit_host_listing_path(@listing)
    assert_template 'host/listings/edit'
    assert_select 'title', "Edit #{@listing.title} | #{@base_title}"
    patch host_listing_path(@listing), params: { listing: { title: '',
                                                 about: '' } }
    assert_response :unprocessable_entity
    assert_template 'listings/edit'
    # assert_equal @listing.title, 'New listing title'
  end

  test "edit listing with an valid information" do
    get edit_host_listing_path(@listing)
    assert_template 'host/listings/edit'
    assert_select 'title', "Edit #{@listing.title} | #{@base_title}"
    title = 'New listing title'
    about = 'New listing description'
    patch host_listing_path(@listing), params: { listing: { title: title,
                                                 about: about } }
    assert_not flash.empty?
    assert_redirected_to host_listing_url(@listing)
    # assert_equal @listing.title, 'New listing title'
    @listing.reload
    assert_equal title, @listing.title
    assert_equal about, @listing.about
  end
end
