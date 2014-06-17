# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  active     :boolean          default(TRUE)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Employee < ActiveRecord::Base
	# Associations
	has_many :events
	has_one :user

	# Methods
	

end
