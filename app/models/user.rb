# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :string           default("f")
#  bio                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  firstname              :string           not null
#  location               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  reviews_count          :integer          default(0)
#  surname                :string           not null
#  username               :string           not null
#  ywam_base              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, foreign_key: :host_id, dependent: :destroy

  def name
    "#{firstname} #{surname}"
  end

  # wishlist association
  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_listings, through: :wishlists, source: :wishable, source_type: "Listing"

  # review association
  has_many :reviews, dependent: :destroy
  has_many :reviewed_listings, through: :reviews, source: :reviewable, source_type: "Listing"

  # user avatar
  has_one_attached :avatar do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end

  validates :avatar, content_type: { in: %w[image/jpeg image/png],
                                    message: "must be a valid image format" },
                    size:         { less_than: 1.megabytes,
                                    message:   "should be less than 1MB" }
end
