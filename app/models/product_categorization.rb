# == Schema Information
#
# Table name: product_categorizations
#
#  id                  :bigint           not null, primary key
#  product_id          :bigint
#  product_category_id :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ProductCategorization < ActiveRecord::Base

	# Associations
	
  belongs_to :product
  belongs_to :product_category

end
