# == Schema Information
#
# Table name: facilities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_facilities_on_name  (name) UNIQUE
#
class Facility < ApplicationRecord
    # downcase facility name callback
    before_save :downcase_name

    validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

    has_many :listing_facilities, dependent: :destroy
    has_many :listings, through: :listing_facilities

    private

    # transform facility name to lowercase before save
    def downcase_name
        self.name.downcase!
    end
end
