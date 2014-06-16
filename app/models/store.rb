# == Schema Information
#
# Table name: stores
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address_name :string(255)
#  street       :string(255)
#  zip          :string(255)
#  city         :string(255)
#  phone        :string(255)
#  email        :string(255)
#  active       :boolean          default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#  latitude     :float
#  longitude    :float
#  description  :text
#

class Store < ActiveRecord::Base

	# Associations

	has_many :stocks
	has_many :products, through: :stocks

	# Geocoder

	geocoded_by :full_address

	# Callbacks
	
	# Don't geocode for now, use rake task instead
	# after_validation :geocode


	# Scopes

	# Methods

	def full_address
		"#{address_name}, #{street}, #{zip} #{city}"
	end

	def short_name
		case id
		when 1
			"l"
		when 2
			"c"
		when 3
			"f"
		when 4
			"s"
		when 5
			"b1"
		when 6
			"m"
		end
	end

end
