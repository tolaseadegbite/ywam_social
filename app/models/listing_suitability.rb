# == Schema Information
#
# Table name: listing_suitabilities
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  listing_id     :bigint           not null
#  suitability_id :bigint           not null
#
# Indexes
#
#  index_listing_suitabilities_on_listing_id      (listing_id)
#  index_listing_suitabilities_on_suitability_id  (suitability_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (suitability_id => suitabilities.id)
#
class ListingSuitability < ApplicationRecord
  belongs_to :listing
  belongs_to :suitability
end
