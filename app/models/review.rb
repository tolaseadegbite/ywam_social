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
class Review < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: [:reviewable_id, :reviewable_type] }

  belongs_to :user

  belongs_to :reviewable, polymorphic: true, counter_cache: :reviews_count

  has_many :reviewed_users, through: :reviews, source: :user
end
