# == Schema Information
#
# Table name: brands
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  slug              :string(255)
#

require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
