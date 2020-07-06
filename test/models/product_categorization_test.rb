# == Schema Information
#
# Table name: product_categorizations
#
#  id                  :bigint           not null, primary key
#  product_id          :bigint
#  product_category_id :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ProductCategorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
