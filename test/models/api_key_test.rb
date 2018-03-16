# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_api_keys_on_user_id  (user_id)
#

require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
