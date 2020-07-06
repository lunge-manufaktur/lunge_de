# == Schema Information
#
# Table name: product_images
#
#  id                 :bigint           not null, primary key
#  product_id         :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  default            :boolean          default(FALSE), not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  image              :string
#

require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
