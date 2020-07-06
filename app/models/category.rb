# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  depth      :integer
#  slug       :string
#

class Category < ActiveRecord::Base

	# Associations
	has_many :categorizations
	has_many :posts, through: :categorizations
	belongs_to :parent, class_name: "Category", optional: true
	has_many :children, foreign_key: :parent_id, class_name: "Category"

	# awesome_nested_sets gem
	acts_as_nested_set

	# Friendly ID
	include FriendlyId
	friendly_id :name, :use => :slugged

	# Methods
	def post_count
		posts.count
	end
	
end
