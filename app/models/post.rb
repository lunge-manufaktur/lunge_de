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
#

class Post < ActiveRecord::Base

	# Associations

	has_many :categories, through: :categorizations
	has_many :categorizations

	accepts_nested_attributes_for :categories, :categorizations

	# Scopes

	scope :published, -> { where(is_published: true) }

	# Methods

	def short_description(length=nil)
		length ||= 200
		content.truncate(length, separator: " ") unless content.nil?
	end

end
