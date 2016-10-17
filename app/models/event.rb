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
# Indexes
#
#  index_events_on_employee_id  (employee_id)
#  index_events_on_store_id     (store_id)
#

class Event < ActiveRecord::Base
	# simple_calendar gem
	extend SimpleCalendar
	has_calendar
	
	# associations
  belongs_to :user
  belongs_to :store
  belongs_to :employee

  # methods
  def status
  	if store_id
  		self.store.name
  	else
  		custom_status
  	end
  end

  def working_hours
  	Time.at(ends_at - starts_at - pause.to_f).utc.strftime("%H:%M")
  end


end
