# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  subtitle     :string(255)
#  content      :text
#  is_published :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  slug         :string(255)
#

class Post < ActiveRecord::Base

	# Associations
	has_many :categories, through: :categorizations
	has_many :categorizations
	has_many :post_images

	accepts_nested_attributes_for :categories, :categorizations

	# Friendly ID
	include FriendlyId
	friendly_id :title, :use => :slugged

	# Scopes
	scope :published, -> { where(is_published: true) }

	# Methods
	def short_description(length=nil)
		length ||= 200
		content.truncate(length, separator: " ") unless content.nil?
	end

end
