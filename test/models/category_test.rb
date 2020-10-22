# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  depth      :integer
#  lft        :integer
#  name       :string
#  rgt        :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
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
