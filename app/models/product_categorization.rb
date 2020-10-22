# == Schema Information
#
# Table name: product_categorizations
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :bigint
#  product_id          :bigint
#
# Indexes
#
#  index_product_categorizations_on_product_category_id  (product_category_id)
#  index_product_categorizations_on_product_id           (product_id)
#

class ProductCategorization < ActiveRecord::Base

	# Associations
	
  belongs_to :product
  belongs_to :product_category

end
