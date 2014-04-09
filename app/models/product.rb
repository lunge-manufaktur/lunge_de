# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  sku                  :string(255)
#  description          :text             default("Beschreibung folgt")
#  created_at           :datetime
#  updated_at           :datetime
#  size_id              :integer
#  brand_id             :integer
#  regular_price        :decimal(8, 2)
#  current_price        :decimal(8, 2)
#  color                :string(255)
#  is_published         :boolean
#  official_description :text
#

class Product < ActiveRecord::Base

	# Associations

	belongs_to :brand
	belongs_to :size
	has_many :product_images
	has_many :stocks, dependent: :destroy
	has_many :stores, through: :stocks
	has_many :properties, dependent: :destroy

	accepts_nested_attributes_for :product_images, :allow_destroy => true
	accepts_nested_attributes_for :stocks, :allow_destroy => true
	accepts_nested_attributes_for :properties, :allow_destroy => true

	# Scopes

	scope :published, -> { where(is_published: true) }

	# Methods

	include IconHelper

	def default_image(size=nil)
    if self.product_images.any?
    	pi = self.product_images.featured.first || self.product_images.first
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



	def short_description(length=nil)
		@length = length || 200
		description.truncate(@length, separator: " ") unless description.nil?
	end



	def name_with_brand
		if self.brand
			"#{self.brand.name} #{name}"
		else
			name
		end
	end


	def stock_icon(store, size)
		status = eval("self.stocks.#{store}.#{size}?")
		if status
			inline_icon("", "ion-ios7-checkmark", "limegreen")
		else
			inline_icon("", "ion-ios7-close", "lightgray")
		end
	end

	def stock_quantity(store, size)
		eval("self.stocks.#{store}.#{size}?")
	end

end
