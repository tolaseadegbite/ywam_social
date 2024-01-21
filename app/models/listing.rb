# == Schema Information
#
# Table name: listings
#
#  id             :bigint           not null, primary key
#  about          :text
#  address_line_1 :string
#  address_line_2 :string
#  city           :string
#  country        :string
#  furniture      :integer          default("unfurnished")
#  lat            :decimal(10, 6)
#  listing_type   :integer          default("cabin")
#  lng            :decimal(10, 6)
#  max_guests     :integer          default(1)
#  postal_code    :string
#  size           :integer
#  state          :string
#  status         :integer          default("draft")
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  host_id        :bigint           not null
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

  # listing facilities association
  has_many :listing_facilities, dependent: :destroy
  has_many :facilities, through: :listing_facilities

  # listing amenities association
  has_many :listing_amenities, dependent: :destroy
  has_many :amenities, through: :listing_amenities

  # listing suitablities association
  has_many :listing_suitabilities, dependent: :destroy
  has_many :suitabilities, through: :listing_suitabilities

  # scope listings by published status
  scope :published, -> { where(status: :published) }

  # concatenate address, city and coountry for easy readablity
  def address
    "#{address_line_1} #{address_line_2} #{city} #{country}"
  end
end
