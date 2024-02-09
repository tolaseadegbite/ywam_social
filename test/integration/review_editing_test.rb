require "test_helper"

class ReviewEditingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @reviewable = listings(:treehouse)
    @review = reviews(:review_1)
    sign_in @user
  end

  test "do not update review with invalid information" do
    title = 'new title'
    body = 'new body'
    rating = 0
    patch listing_review_path(@reviewable, @review), params: { review: { title: title, body: body, rating: rating } }
    assert_response :unprocessable_entity
    assert_template 'reviews/edit'
    assert_select 'div.text-danger'
  end

  test "update review with valid information" do
    title = 'new title'
    body = 'new body'
    rating = 4
    patch listing_review_path(@reviewable, @review, format: :turbo_stream), params: { review: { title: title, body: body, rating: rating } }
    assert_not flash.empty?
    @review.reload
    assert_equal title, @review.title
    assert_equal body, @review.body
    assert_equal rating, @review.rating
  end
end
