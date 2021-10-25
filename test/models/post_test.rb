# == Schema Information
#
# Table name: posts
#
#  id                :bigint           not null, primary key
#  content           :text
#  frontend_url      :string
#  icon_content_type :string
#  icon_file_name    :string
#  icon_file_size    :bigint
#  icon_updated_at   :datetime
#  is_featured       :boolean
#  is_on_homepage    :boolean
#  is_published      :boolean
#  meta_description  :text
#  slug              :string
#  subtitle          :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_posts_on_is_featured  (is_featured)
#  index_posts_on_slug         (slug)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
