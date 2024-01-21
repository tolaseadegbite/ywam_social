# == Schema Information
#
# Table name: listing_facilities
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  facility_id :bigint           not null
#  listing_id  :bigint           not null
#
# Indexes
#
#  index_listing_facilities_on_facility_id  (facility_id)
#  index_listing_facilities_on_listing_id   (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (facility_id => facilities.id)
#  fk_rails_...  (listing_id => listings.id)
#
class ListingFacility < ApplicationRecord
  belongs_to :listing
  belongs_to :facility
end
