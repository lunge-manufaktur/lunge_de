# == Schema Information
#
# Table name: product_categories
#
#  id        :bigint           not null, primary key
#  name      :string
#  parent_id :integer
#  lft       :integer
#  rgt       :integer
#  depth     :integer
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
