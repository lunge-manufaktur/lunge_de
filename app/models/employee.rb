# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
	# Associations
	has_many :events
	has_one :user

	# Methods
	

end
