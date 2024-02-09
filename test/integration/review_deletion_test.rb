require "test_helper"

class ReviewDeletionTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @reviewable = listings(:treehouse)
    @review = reviews(:review_1)
    sign_in @user
  end

  test "delete (archive) listing" do
    assert_difference 'Review.count', -1 do
      delete listing_review_path(@reviewable, @review, format: :turbo_stream)
    end
    assert_not flash.empty?
  end
end
