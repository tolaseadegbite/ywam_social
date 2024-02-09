require "test_helper"

class ReviewCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @reviewable = listings(:treehouse)
    @review = reviews(:review_1)
    sign_in @user
  end

  test "do not create review with invalid information" do
    get new_listing_review_path(@reviewable)
    assert_template 'reviews/new'
    assert_no_difference 'Review.count' do
      post listing_reviews_path(@reviewable), params: { review: { title: 'title', body: 'body', rating: nil } }
    end
    assert_response :unprocessable_entity
    assert_template 'reviews/new'
    assert_select 'div.text-danger'
  end

  test "create review with invalid information" do
    get new_listing_review_path(@reviewable)
    assert_template 'reviews/new'
    assert_difference 'Review.count', 1 do
      post listing_reviews_path(@reviewable, format: :turbo_stream), params: { review: { title: 'title', body: 'body', rating: 5 } }
    end
    assert_template 'reviews/_review'
  end
end
