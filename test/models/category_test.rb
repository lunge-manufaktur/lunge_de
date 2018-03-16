# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  depth      :integer
#  slug       :string(255)
#
# Indexes
#
#  index_categories_on_slug  (slug)
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
