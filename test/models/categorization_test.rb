# == Schema Information
#
# Table name: categorizations
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_categorizations_on_category_id  (category_id)
#  index_categorizations_on_post_id      (post_id)
#

require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
