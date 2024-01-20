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
#  lat            :decimal(10, 6)
#  listing_type   :integer          default("cabin")
#  lng            :decimal(10, 6)
#  max_guests     :integer          default(1)
#  postal_code    :string
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
  validates :title, presence: true
  validates :max_guests, :max_guests, numericality: { greater_than: 0, less_than: 101 }
  belongs_to :host, class_name: 'User'

  enum status: { draft: 0, published: 1, archived: 2 }
  enum listing_type: { cabin: 0, farm: 1, apartment: 2, condo: 3, hut: 4, yurt: 5, treehouse: 6, trailer: 7 }

  has_many :rooms, dependent: :destroy

  scope :published, -> { where(status: :published) }

  def address
    "#{address_line_1} #{address_line_2} #{city} #{country}"
  end
end
