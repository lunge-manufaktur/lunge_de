# == Schema Information
#
# Table name: post_images
#
#  id                 :integer          not null, primary key
#  post_id            :integer
#  default            :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_post_images_on_post_id  (post_id)
#

require 'spec_helper'

describe PostImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
