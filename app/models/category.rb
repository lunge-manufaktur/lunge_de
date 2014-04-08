# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#

class Category < ActiveRecord::Base

	# Associations

	has_many :posts, through: :categorizations

	belongs_to :parent, class_name: "Category"
	has_many :subcategories, foreign_key: :parent_id, class_name: "Category"
	
end
