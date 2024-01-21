# == Schema Information
#
# Table name: suitabilities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_suitabilities_on_name  (name) UNIQUE
#
class Suitability < ApplicationRecord
    # downcase suitability name callback
    before_save :downcase_name

    validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

    has_many :listing_suitabilities, dependent: :destroy
    has_many :listings, through: :listing_suitabilities

    private

    # transform suitability name to lowercase before save
    def downcase_name
        self.name.downcase!
    end
end
