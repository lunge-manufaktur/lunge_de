# == Schema Information
#
# Table name: properties
#
#  id         :bigint           not null, primary key
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#
# Indexes
#
#  index_properties_on_product_id  (product_id)
#

class Property < ActiveRecord::Base

	# Associations

	belongs_to :product

end
