# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  depth      :integer
#  slug       :string(255)
#

class Category < ActiveRecord::Base

	# Associations
	has_many :categorizations
	has_many :posts, through: :categorizations
	belongs_to :parent, class_name: "Category"
	has_many :children, foreign_key: :parent_id, class_name: "Category"

	# awesome_nested_sets gem
	acts_as_nested_set

	# Friendly ID
	include FriendlyId
	friendly_id :name, :use => :slugged

	# Methods
	
	
end
