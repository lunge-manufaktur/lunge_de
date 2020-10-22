# == Schema Information
#
# Table name: product_categories
#
#  id        :bigint           not null, primary key
#  depth     :integer
#  lft       :integer
#  name      :string
#  rgt       :integer
#  parent_id :integer
#
# Indexes
#
#  index_product_categories_on_depth      (depth)
#  index_product_categories_on_lft        (lft)
#  index_product_categories_on_parent_id  (parent_id)
#  index_product_categories_on_rgt        (rgt)
#

class ProductCategory < ActiveRecord::Base

	# Associations
	belongs_to :parent, class_name: "ProductCategory"
	has_many :children, foreign_key: "parent_id", class_name: "ProductCategory"
	has_many :product_categorizations, dependent: :destroy
	has_many :products, through: :product_categorizations

	# awesome_nested_sets gem
	acts_as_nested_set

end
