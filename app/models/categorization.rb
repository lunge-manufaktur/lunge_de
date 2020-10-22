# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  post_id     :bigint
#
# Indexes
#
#  index_categorizations_on_category_id  (category_id)
#  index_categorizations_on_post_id      (post_id)
#

class Categorization < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
end
