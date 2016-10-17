# == Schema Information
#
# Table name: product_categorizations
#
#  id                  :integer          not null, primary key
#  product_id          :integer
#  product_category_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_product_categorizations_on_product_category_id  (product_category_id)
#  index_product_categorizations_on_product_id           (product_id)
#

require 'test_helper'

class ProductCategorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
