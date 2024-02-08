# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  body            :text
#  rating          :integer
#  reviewable_type :string           not null
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  reviewable_id   :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_reviews_on_reviewable                                     (reviewable_type,reviewable_id)
#  index_reviews_on_reviewable_id_and_reviewable_type              (reviewable_id,reviewable_type)
#  index_reviews_on_user_id                                        (user_id)
#  index_reviews_on_user_id_and_reviewable_id_and_reviewable_type  (user_id,reviewable_id,reviewable_type) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:tolase)
    @reviewable = listings(:treehouse)
    @review = @user.reviews.build(title: 'Bad review', body: 'This is an example bad review', rating: 1, reviewable: @reviewable)
  end

  test "must be valid" do
    assert @review.valid?
  end

  test "user must be present" do
    @review.user = nil
    assert_not @review.valid?
  end

  test "body must be present" do
    @review.body = ''
    assert_not @review.valid?
  end

  test "rating must be present" do
    @review.rating = nil
    assert_not @review.valid?
  end

  test "rating must be integer" do
    @review.rating = 3.5
    assert_not @review.valid?
  end

  test "rating must be greater than zero" do
    @review.rating = 0
    assert_not @review.valid?
  end

  test "rating must be less than six" do
    @review.rating = 6
    assert_not @review.valid?
  end
end
