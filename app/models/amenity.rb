# == Schema Information
#
# Table name: amenities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_amenities_on_name  (name) UNIQUE
#
class Amenity < ApplicationRecord
    # downcase amenity name callback
    before_save :downcase_name

    # validations
    validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

    # listing association
    has_many :listing_amenities, dependent: :destroy
    has_many :listings, through: :listing_amenities

    private

    # transform amenity name to lowercase before save
    def downcase_name
        self.name.downcase!
    end
end
