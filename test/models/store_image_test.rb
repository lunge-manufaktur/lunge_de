# == Schema Information
#
# Table name: store_images
#
#  id                 :bigint           not null, primary key
#  default            :boolean          default(FALSE)
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  store_id           :bigint
#
# Indexes
#
#  index_store_images_on_default   (default)
#  index_store_images_on_store_id  (store_id)
#

require 'test_helper'

class StoreImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
