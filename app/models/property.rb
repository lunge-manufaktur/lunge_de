# == Schema Information
#
# Table name: attributes
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Property < ActiveRecord::Base

	# Associations

	belongs_to :product

end
