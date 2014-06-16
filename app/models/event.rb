# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  employee_id   :integer
#  store_id      :integer
#  starts_at     :datetime
#  ends_at       :datetime
#  pause         :time
#  vacation      :boolean          default(FALSE)
#  sick          :boolean          default(FALSE)
#  comment       :text
#  created_at    :datetime
#  updated_at    :datetime
#  custom_status :string(255)
#  manager       :boolean          default(FALSE)
#

class Event < ActiveRecord::Base
	extend SimpleCalendar
	has_calendar
	
  belongs_to :user
  belongs_to :store
  belongs_to :employee
end
