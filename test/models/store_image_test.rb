# == Schema Information
#
# Table name: store_images
#
#  id                 :bigint           not null, primary key
#  store_id           :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  default            :boolean          default(FALSE)
#

require 'test_helper'

class StoreImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
