# == Schema Information
#
# Table name: product_categorizations
#
#  id                  :integer          not null, primary key
#  product_id          :integer
#  product_category_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class ProductCategorization < ActiveRecord::Base

	# Associations
	
  belongs_to :product
  belongs_to :product_category

end
