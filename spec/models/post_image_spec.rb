# == Schema Information
#
# Table name: post_images
#
#  id                 :bigint           not null, primary key
#  default            :boolean
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  post_id            :bigint
#
# Indexes
#
#  index_post_images_on_post_id  (post_id)
#

require 'spec_helper'

describe PostImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
