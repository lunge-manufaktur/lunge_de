# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_properties_on_product_id  (product_id)
#

class Property < ActiveRecord::Base

	# Associations

	belongs_to :product

end
