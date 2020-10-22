# == Schema Information
#
# Table name: product_images
#
#  id                 :bigint           not null, primary key
#  default            :boolean          default(FALSE), not null
#  image              :string
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  product_id         :bigint
#
# Indexes
#
#  index_product_images_on_product_id  (product_id)
#

require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
