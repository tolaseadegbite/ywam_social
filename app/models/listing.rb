# == Schema Information
#
# Table name: listings
#
#  id              :bigint           not null, primary key
#  about           :text
#  address_line_1  :string
#  address_line_2  :string
#  average_rating  :decimal(, )      default(0.0)
#  city            :string
#  country         :string
#  furniture       :integer          default("unfurnished")
#  lat             :decimal(10, 6)
#  listing_type    :integer          default("cabin")
#  lng             :decimal(10, 6)
#  max_guests      :integer          default(1)
#  postal_code     :string
#  reviews_count   :integer          default(0)
#  size            :integer
#  state           :string
#  status          :integer          default("draft")
#  title           :string           not null
#  wishlists_count :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  host_id         :bigint           not null
#
# Indexes
#
#  index_listings_on_host_id  (host_id)
#
# Foreign Keys
#
#  fk_rails_...  (host_id => users.id)
#
class Listing < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :max_guests, :max_guests, numericality: { greater_than: 0, less_than: 101 }

  # association to host/user
  belongs_to :host, class_name: 'User'

  # enum attributes
  enum status: { draft: 0, published: 1, archived: 2 }
  enum listing_type: { cabin: 0, farm: 1, apartment: 2, condo: 3, hut: 4, yurt: 5, treehouse: 6, trailer: 7 }
  enum furniture: { unfurnished: 0, furnished: 1 }

  # rooms association
  has_many :rooms, dependent: :destroy

  # listing photos association
  has_many :listing_photos, dependent: :destroy, inverse_of: :listing
  accepts_nested_attributes_for :listing_photos, allow_destroy: true, reject_if: :all_blank

  # listing facilities association
  has_many :listing_facilities, dependent: :destroy
  has_many :facilities, through: :listing_facilities, dependent: :destroy

  # listing amenities association
  has_many :listing_amenities, dependent: :destroy
  has_many :amenities, through: :listing_amenities, dependent: :destroy

  # listing suitablities association
  has_many :listing_suitabilities, dependent: :destroy
  has_many :suitabilities, through: :listing_suitabilities, dependent: :destroy

  # scope listings by published status and id
  scope :published, -> { where(status: :published) }
  scope :ordered, -> { order(id: :desc) }

  # wishlist association
  has_many :wishlists, as: :wishable, dependent: :destroy
  has_many :wishlist_users, through: :wishlists, source: :user, dependent: :destroy

  # review association
  has_many :reviews, as: :reviewable, dependent: :destroy

  # concatenate address, city and coountry for easy readablity
  def address
    "#{address_line_1} #{address_line_2} #{city} #{country}"
  end
end
