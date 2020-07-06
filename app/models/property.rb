# == Schema Information
#
# Table name: properties
#
#  id         :bigint           not null, primary key
#  product_id :integer
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Property < ActiveRecord::Base

	# Associations

	belongs_to :product

end
