require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @review = reviews(:review_1)
    @reviewable = listings(:treehouse)
  end

  test "redirect new when user is not signed in" do
    get new_listing_review_path(@reviewable)
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "redirect create when user is not signed in" do
    assert_no_difference 'Review.count' do
      post listing_reviews_path(@reviewable), params: { review: { title: 'Test review', body: 'body', rating: 5 } }
    end
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "redirect edit when user is not signed in" do
    get edit_listing_review_path(@reviewable, @review)
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "redirect update when user is not signed in" do
    patch listing_review_path(@reviewable, @review), params: { review: { title: 'new one', body: 'new body', rating: 4 } }
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "redirect destroy when user is not signed in" do
    delete listing_review_path(@reviewable, @review)
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end
end
