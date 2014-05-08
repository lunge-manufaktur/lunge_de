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
	accepts_nested_attributes_for :post_images, :allow_destroy => true

	# Friendly ID
	include FriendlyId
	friendly_id :title, :use => :slugged

	# Scopes
	scope :published, -> { where(is_published: true) }
  scope :homepage, -> { where(is_on_homepage: true) }

	# Methods
	def short_description(length=nil)
		length ||= 200
		content.truncate(length, separator: " ") unless content.nil?
	end

	def default_image(size=nil)
    if self.post_images.any?
    	pi = self.post_images.first || self.post_images.first
    	pi.image.url(size)
    else
    	case size
    	when "full_width"
    		""
    	when "large"
    		"http://placehold.it/1600&text=Kein+Bild+vorhanden"
    	when "medium"
    		"http://placehold.it/1024&text=Kein+Bild+vorhanden"
    	when "small"
    		"http://placehold.it/640&text=Kein+Bild+vorhanden"
    	when "thumb"
    		"http://placehold.it/300&text=Kein+Bild+vorhanden"
    	when "card"
    		"http://placehold.it/640&text=Kein+Bild+vorhanden"
    	end
    end
	end

end
