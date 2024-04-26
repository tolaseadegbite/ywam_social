# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  room_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#
# Indexes
#
#  index_rooms_on_listing_id  (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#
class Room < ApplicationRecord
  belongs_to :listing

  has_many :beds, dependent: :destroy, inverse_of: :room
  
  accepts_nested_attributes_for :beds, allow_destroy: true, reject_if: :all_blank
  
  enum room_type: { 
    Bedroom: 0, 
    'Living room': 1, 
    'Basement': 2 
  }
end
