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

require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
