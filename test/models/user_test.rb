# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :string           default("f")
#  bio                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  firstname              :string           not null
#  location               :string
#  mod                    :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  reviews_count          :integer          default(0)
#  surname                :string           not null
#  username               :string
#  ywam_base              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  users_username_lower                 (lower((username)::text) text_pattern_ops) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  
end
