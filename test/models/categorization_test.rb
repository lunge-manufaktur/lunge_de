# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  post_id     :bigint
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
