# == Schema Information
#
# Table name: brands
#
#  id                :bigint           not null, primary key
#  description       :text
#  logo_content_type :string
#  logo_file_name    :string
#  logo_file_size    :bigint
#  logo_updated_at   :datetime
#  meta_description  :text
#  meta_title        :text
#  name              :string
#  slug              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_brands_on_slug  (slug) UNIQUE
#

require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
