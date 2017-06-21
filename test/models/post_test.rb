# == Schema Information
#
# Table name: posts
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  subtitle          :string(255)
#  content           :text
#  is_published      :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  slug              :string(255)
#  is_on_homepage    :boolean
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#  is_featured       :boolean
#  meta_description  :text
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
