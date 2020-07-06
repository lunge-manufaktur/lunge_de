# == Schema Information
#
# Table name: posts
#
#  id                :bigint           not null, primary key
#  title             :string
#  subtitle          :string
#  content           :text
#  is_published      :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string
#  is_on_homepage    :boolean
#  icon_file_name    :string
#  icon_content_type :string
#  icon_file_size    :bigint
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
