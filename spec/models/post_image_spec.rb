# == Schema Information
#
# Table name: post_images
#
#  id                 :bigint           not null, primary key
#  post_id            :bigint
#  default            :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#

require 'spec_helper'

describe PostImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
