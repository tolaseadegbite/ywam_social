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
require "test_helper"

class SuitabilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
