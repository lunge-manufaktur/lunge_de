# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint           not null, primary key
#  post_id     :bigint
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
