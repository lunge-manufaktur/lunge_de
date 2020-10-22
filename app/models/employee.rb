# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
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
