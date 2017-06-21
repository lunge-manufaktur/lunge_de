# == Schema Information
#
# Table name: store_images
#
#  id                 :integer          not null, primary key
#  store_id           :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  default            :boolean          default(FALSE)
#

require 'test_helper'

class StoreImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
