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
# Indexes
#
#  index_employees_on_active   (active)
#  index_employees_on_user_id  (user_id)
#

class Employee < ActiveRecord::Base
	# Associations
	has_many :events
	has_one :user

	# Methods
	

end
