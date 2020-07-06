# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  employee_id   :bigint
#  store_id      :bigint
#  starts_at     :datetime
#  ends_at       :datetime
#  pause         :time
#  vacation      :boolean          default(FALSE)
#  sick          :boolean          default(FALSE)
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  custom_status :string
#  manager       :boolean          default(FALSE)
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
